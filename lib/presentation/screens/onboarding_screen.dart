import 'package:flutter/material.dart';

import 'package:tasking/presentation/widgets/custom_onboard_page.dart';
import 'package:tasking/shared/const.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: nextPage,
        children: [
          CustomOnboardPage(
            img: 'assets/images/first.jpeg',
            text: 'Hello in the Store',
            btnText: 'Next',
            onTap: () {
              nextPage.animateToPage(
                1,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeIn,
              );
            },
          ),
          CustomOnboardPage(
            img: 'assets/images/second.jpeg',
            text: 'Continu to the third Screen',
            btnText: 'Next',
            onTap: () {
              nextPage.animateToPage(
                2,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeIn,
              );
            },
          ),
          CustomOnboardPage(
            img: 'assets/images/third.jpeg',
            text: 'Continu to the Home Screen',
            btnText: 'Get Started',
            onTap: () {
              Navigator.pushNamed(context, 'register');
            },
          ),
        ],
      ),
    );
  }
}
