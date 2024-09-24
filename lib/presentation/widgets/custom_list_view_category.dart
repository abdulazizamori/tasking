import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListViewCategory extends StatelessWidget {
  const CustomListViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: double.infinity,
      child: ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  elevation: 15,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/first.jpeg',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const Text('Electronics'),
              ],
            );
          }),
    );
  }
}
