import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: const WormEffect(
        activeDotColor: Colors.deepPurple,
        dotColor: Colors.grey,
        dotHeight: 10,
        dotWidth: 10,
        spacing: 16.0,
      ),
    );
  }
}
