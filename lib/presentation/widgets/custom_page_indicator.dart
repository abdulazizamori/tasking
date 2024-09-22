import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasking/shared/const.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
          controller: nextPage,
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