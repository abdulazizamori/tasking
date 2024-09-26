import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';

class CustomListViewCategory extends StatelessWidget {
  const CustomListViewCategory({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceCubit, EcommerceState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<EcommerceCubit>();
        return SizedBox(
          height: 90.h,
          width: double.infinity,
          child: ListView.separated(
            itemCount: cubit.eComodel.length,
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
                    
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        cubit.eComodel[index].category!.image!.toString(),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 1.h,
                  // ),
                  Text(cubit.eComodel[index].category!.name!.name),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
