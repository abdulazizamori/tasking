import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tasking/presentation/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
              duration: const Duration(milliseconds: 4000),
              backgroundColor: Colors.white,
              childWidget: Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/ecommerse.png",
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Ecommerse',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              onAnimationEnd: () => debugPrint("On Fade In End"),
              nextScreen: const OnboardingScreen(),
            ),
    );
  }
}