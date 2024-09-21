import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tasking/presentation/screens/home_screen.dart';
import 'package:tasking/presentation/screens/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter TASKAAAT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FlutterSplashScreen.fadeIn(
        duration: const Duration(milliseconds: 4000),
        backgroundColor: Colors.white,
          childWidget: Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Image.asset("assets/ecommerse.png" , width: 200,height: 200,),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Ecommerse UI Theme',style: TextStyle(fontSize: 20 ),),
                ],
              ),
            ),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: Registerpage(),
      ),
      // routes: {
      //   'register' : (context)=>
      // },
    );
  }
}

