import 'package:flutter/material.dart';

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
        children: [
          Column(
            children: [
              Image.asset('assets/images/first.jpeg'),
              Text(
                'Hello in E commerse',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Center(
                    child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset('assets/images/second.jpeg'),
              Text(
                'Continu to the third Screen',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Center(child: Text('Next',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),)),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset('assets/images/third.jpeg'),
              Text(
                'Continu to the Home Screen',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: Center(child: Text('Next',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
