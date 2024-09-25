import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/di.dart';
import '../../../core/network/dio.dart';
import '../../../core/network/endpoints.dart';
import '../../../data/offline/cache_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  // final _formKey = GlobalKey<FormState>();

  AuthCubit() : super(AuthInitial()){
    checkAuthStatus();
  }

  /// Register a new user
  Future<void> registerUser(
      String email, String password, String name, String? avatar) async {
    if (_imageFile == null) {
      emit(UserCreateError("No image selected."));
      return;
    }

    String avatarUrl = await uploadImage(_imageFile!);
    try {
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
        "name": name,
        "avatar": avatarUrl, // Using the uploaded image URL
      };

      Response response =
          await di<DioHelper>().postData(url: regUrl, data: data);
      print(response.data);

      if (response.statusCode == 201) {
        emit(UserCreateSuccess());
      } else {
        emit(UserCreateFailure(response.statusCode, response.data));
      }
    } catch (e) {
      emit(UserCreateError("Error occurred: $e"));
    }
  }

  /// Pick an image from the gallery
  Future<void> pickImage() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
        emit(ImagePicked(_imageFile!));
      } else {
        emit(UserCreateError("Image picking cancelled."));
      }
    } catch (e) {
      emit(UserCreateError("Error picking image: $e"));
    }
  }

  /// Upload the image and return a URL (mock implementation)
  Future<String> uploadImage(File image) async {
    // Replace this with actual logic to upload the image
    return "https://your-storage-service.com/images/${image.path.split('/').last}";
  }




  Future<void> signin(String email,String password)async {
    emit(AuthLoading());

    try{
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };
    Response response =
    await di<DioHelper>().postData(url: signInUrl, data: data);
    print(response.statusCode);
    if (response.statusCode == 201) {
      // Extract the token from the response
      String token = response.data['access_token'];
      print(response.data);


      // Save the token using SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      emit(AuthSuccess(token)); // Emit success with token
    } else {
      emit(AuthFailure('Invalid credentials'));
    }
  } catch (e) {
  emit(UserCreateError("Error occurred: $e"));
  }

  }

  /// Check login status from cache
  Future<void> checkAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    if (token != null) {
      emit(AuthSuccess(token)); // User is already authenticated
    } else {
      emit(AuthInitial()); // No token found, back to initial state
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get('auth_token'));
    await prefs.remove('auth_token');
    print(prefs.get('auth_token'));
    print('User logged out'); // Debug statement
    emit(AuthInitial()); // Emit the initial state after logout
  }



}
