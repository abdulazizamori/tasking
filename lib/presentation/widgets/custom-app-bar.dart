import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/main.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo1.png',width: 60.w,height: 30.h,),
          Text('E-commerce App',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
        ],
      ),
    );
  }
}
