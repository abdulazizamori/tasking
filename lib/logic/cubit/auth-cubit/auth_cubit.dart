import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../core/di/di.dart';
import '../../../core/network/dio.dart';
import '../../../core/network/endpoints.dart';
import '../../../data/offline/cache_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  // final _formKey = GlobalKey<FormState>();

  AuthCubit() : super(AuthInitial());

  /// Register a new user
  Future<void> registerUser(
      String email, String password, String name, String? avatar) async {
    if (_imageFile == null) {
      emit(UserAuthError("No image selected."));
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

      if (response.statusCode == 200) {
        emit(UserAuthSuccess());
      } else {
        emit(UserAuthFailure(response.statusCode, response.data));
      }
    } catch (e) {
      emit(UserAuthError("Error occurred: $e"));
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
        emit(UserAuthError("Image picking cancelled."));
      }
    } catch (e) {
      emit(UserAuthError("Error picking image: $e"));
    }
  }

  /// Upload the image and return a URL (mock implementation)
  Future<String> uploadImage(File image) async {
    // Replace this with actual logic to upload the image
    return "https://your-storage-service.com/images/${image.path.split('/').last}";
  }

  /// Login function
  Future<void> login(String username, String password) async {
    try {
      if (username == 'user' && password == 'pass') {
        await CacheHelper().setData(key: 'isLoggedIn', value: true);
        emit(LoggedIn());
      } else {
        emit(LoginError("Invalid username or password"));
      }
    } catch (e) {
      emit(LoginError("Error occurred: $e"));
    }
  }

  /// Check login status from cache
  Future<void> checkLoginStatus() async {
    bool isLoggedIn =
        CacheHelper.sharedPreferences.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      emit(LoggedIn());
    } else {
      emit(LoggedOut());
    }
  }
}
