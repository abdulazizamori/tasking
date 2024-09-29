import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowHeaders extends StatelessWidget {
  const CustomRowHeaders({super.key, required this.title, required this.endTitle});
  final String title;
  final String endTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          endTitle,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
