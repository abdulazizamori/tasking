import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';



class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController _Name = TextEditingController();
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _Cpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio(); // Dio instance

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  // Function to send the user data to the API using Dio
  Future<void> _createUser() async {
    if (_formKey.currentState!.validate() && _imageFile != null) {
      try {
        // Convert image to Base64 or send it to a hosting service to get an image URL
        String avatarUrl = await _uploadImage(_imageFile!);

        // API payload
        Map<String, dynamic> userData = {
          "name": _Name.text,
          "email": _Email.text,
          "password": _pass.text,
          "avatar": avatarUrl
        };

        // Sending the data to the API using Dio
        var response = await _dio.post(
          'https://api.escuelajs.co/api/v1/users/',
          data: jsonEncode(userData),
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
        );

        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  UserListPage()),
          );
        } else {
          // Handle error
          print("Failed to create user: ${response.data}");
        }
      } catch (e) {
        // Error handling
        print("Error occurred: $e");
      }
    } else {
      // Show an error if the image is not selected
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select an image')));
    }
  }

  // Example function to upload the image and return a URL (this is a mock)
  Future<String> _uploadImage(File image) async {
    // You can use a service like Firebase or any other storage service to upload the image
    // For simplicity, we are returning a placeholder URL
    return "https://your-storage-service.com/images/${image.path.split('/').last}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Create your account",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(children: [
                  CircleAvatar(
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : const NetworkImage(
                        "https://static.thenounproject.com/png/5034901-200.png") as ImageProvider,
                    backgroundColor: Colors.white,
                    radius: 64,
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                    bottom: -10,
                    left: 80,
                  )
                ]),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: SizedBox(
                    width: 500.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: "Enter Your Name",
                          labelText: "Name",
                          prefixIcon: const Icon(Icons.person)),
                      controller: _Name,
                      validator: (val) {
                        if (val!.isEmpty) return "Enter Your Name";
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: SizedBox(
                    width: 500.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: "Enter Your Email",
                          labelText: "Email",
                          prefixIcon: const Icon(Icons.email)),
                      controller: _Email,
                      validator: (val) {
                        if (val!.isEmpty) return "Enter Your Email";
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: SizedBox(
                    width: 500.w,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: "Enter Your Password",
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.password)),
                      controller: _pass,
                      validator: (val) {
                        if (val!.isEmpty) return "Enter Your password";
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: SizedBox(
                    width: 500.w,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          hintText: "Confirm Password",
                          labelText: "Confirm Password",
                          prefixIcon: const Icon(Icons.password)),
                      controller: _Cpass,
                      validator: (val) {
                        if (val!.isEmpty) return "Enter Your password";
                        if (val != _pass.text) return "Not Match";
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: _createUser,
                    child: const Text("Sign up")),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.purple),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
