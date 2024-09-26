import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/presentation/widgets/custom_grid_products.dart';
import 'package:tasking/presentation/widgets/custom_list_view_category.dart';
import 'package:tasking/presentation/widgets/custom_row_headers.dart';
import 'package:tasking/presentation/widgets/custom_text_form.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          // text form field
          const CustomTextForm(),
          SizedBox(
            height: 20.h,
          ),
          // row
          const CustomRowHeaders(
            title: 'Categories',
            endTitle: 'View All',
          ),
          SizedBox(
            height: 10.h,
          ),
          // list view category
          const CustomListViewCategory(),
          SizedBox(
            height: 10.h,
          ),
          // row
          const CustomRowHeaders(
            title: 'Products',
            endTitle: 'View All',
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomGridProducts(),
        ],
      ),
    );
  }
}
