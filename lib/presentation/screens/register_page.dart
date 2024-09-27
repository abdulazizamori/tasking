import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasking/logic/cubit/auth-cubit/auth_cubit.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}
//hello
class _RegisterpageState extends State<Registerpage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController cPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          final auth = context.read<AuthCubit>();
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
                                      "https://static.thenounproject.com/png/5034901-200.png")
                                  as ImageProvider,
                          backgroundColor: Colors.white,
                          radius: 64,
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: auth.pickImage,
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
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: SizedBox(
                          width: 500.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                hintText: "Enter Your Name",
                                labelText: "Name",
                                prefixIcon: const Icon(Icons.person)),
                            controller: name,
                            validator: (val) {
                              if (val!.isEmpty) return "Enter Your Name";
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: SizedBox(
                          width: 500.w,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                hintText: "Enter Your Email",
                                labelText: "Email",
                                prefixIcon: const Icon(Icons.email)),
                            controller: email,
                            validator: (val) {
                              if (val!.isEmpty) return "Enter Your Email";
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
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
                            controller: pass,
                            validator: (val) {
                              if (val!.isEmpty) return "Enter Your password";
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
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
                            controller: cPass,
                            validator: (val) {
                              if (val!.isEmpty) return "Enter Your password";
                              if (val != pass.text) return "Not Match";
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () {
                           var response =  auth.registerUser(email.text, pass.text, name.text,
                                _imageFile.toString());

                            Navigator.pushNamed(context, 'home_page');
                          },
                          child: const Text("Sign up")),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, 'Log_in');
                              },
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
        },
        listener: (context, state) {});
  }
}
