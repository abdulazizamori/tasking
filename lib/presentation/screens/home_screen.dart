import 'package:flutter/material.dart';
import 'package:tasking/presentation/widgets/custom_show_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 1, // Aspect ratio for each grid item
        ),
        itemCount: 30, // Total number of items
        itemBuilder: (context, index) {
          return CustomShowProduct();
        },
      ),
    );
  }
}
