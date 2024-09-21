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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Image.asset('assets/images/first.jpeg',fit: BoxFit.fill,),
              SizedBox(height: 30,),
              Text(
                'Hello in E commerse',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 100,
                height: 50,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Image.asset('assets/images/second.jpeg'),
              SizedBox(height: 30,),
              Text(
                'Continu to the third Screen',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 100,
                height: 50,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Image.asset('assets/images/third.jpeg'),
              SizedBox(height: 30,),
              Text(
                'Continu to the Home Screen',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 100,
                height: 50,
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
