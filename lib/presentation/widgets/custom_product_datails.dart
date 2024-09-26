import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/data/model/ecommerce-model.dart';
import 'package:tasking/presentation/widgets/custom_page_indicator.dart';

class CustomProductDatails extends StatelessWidget {
  const CustomProductDatails({super.key, required this.ecommerceModel});
  final EcommerceModel ecommerceModel;
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
              itemCount: ecommerceModel.images!.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20.0), // Adjust the radius here
                  child: Image.network(
                    ecommerceModel.images![index] ==
                            'https://placeimg.com/640/480/any'
                        ? 'https://cdn-icons-png.flaticon.com/512/6478/6478111.png'
                        : ecommerceModel
                            .images![index], // Replace with your image asset
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
            ecommerceModel.title!,
            style: TextStyle(
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            ecommerceModel.description!,
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
                  '${ecommerceModel.price.toString()} \$',
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
