import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasking/presentation/widgets/custom_page_indicator.dart';

class CustomProductDatails extends StatelessWidget {
  const CustomProductDatails({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 150.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 7.w,
                );
              },
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20.0), // Adjust the radius here
                  child: Image.asset(
                    'assets/images/first.jpeg', // Replace with your image asset
                    width: 300.w, // Set a width
                    height: 200.h, // Set a height
                    fit: BoxFit.fill, // Adjust the fit as needed
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Align(
            child: CustomPageIndicator(
              controller: pageController,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            'Classic Red Pullover Hoodie',
            style: TextStyle(
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Elevate your casual wardrobe with our Classic Red Pullover Hoodie. Crafted with a soft cotton blend for ultimate comfort, this vibrant red hoodie features a kangaroo pocket, adjustable drawstring hood, and ribbed cuffs for a snug fit. The timeless design ensures easy pairing with jeans or joggers for a relaxed yet stylish look, making it a versatile addition to your everyday attire.',
            style: TextStyle(
              fontSize: 17.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 80.w,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '100 \$',
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
