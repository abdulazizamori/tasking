import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:tasking/data/repo/repo.dart';

import '../../../core/di/di.dart';
import '../../../core/network/dio.dart';
import '../../../core/network/endpoints.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Repository repository;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  AuthCubit(this.repository) : super(AuthInitial());

  Future<void> registerUser(
       String email,
       String password,
       String name,
      String? avatar) async {
      String avatarUrl = await uploadImage(_imageFile!);
      try {
        Map<String, dynamic> data = {
          "email": email,
          "password": password,
          "name": name,
          "avatar": avatar,
        };
        print(data);

        String body = json.encode(data);
        var url = regUrl;

        Response response = await di<DioHelper>().postData(
            url: regUrl, data: data);
        print(response.data);
        if(response.statusCode == 200){
          emit(UserAuthSuccess());
        }else {
          emit(UserAuthFailure(response.statusCode, response.data));
        }
      } catch (e) {
        print("Error occurred: $e");
        emit(UserAuthError(e.toString()));
      }
    }


// Function to pick an image from the gallery
  Future<void> pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  }

  // Example function to upload the image and return a URL (this is a mock)
  Future<String> uploadImage(File image) async {
    // You can use a service like Firebase or any other storage service to upload the image
    // For simplicity, we are returning a placeholder URL
    return "https://your-storage-service.com/images/${image.path.split('/').last}";
  }


  }





