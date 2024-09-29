import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.clear),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
