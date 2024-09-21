import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formState = GlobalKey();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Login Page',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(
                  'assets/John Doe_icon.png',
                ),
              ),
              const SizedBox(width: 5),
              const Text('Login Page', style: TextStyle(color: Colors.black)),
            ],
          ),
          const SizedBox(height: 15),
          Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter your user name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter your User name';
                  }
                  return null;
                },
              ),
            ]),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')));
              }
            },
            child: const Text(
              'Enter',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
