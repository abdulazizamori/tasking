import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';


class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key});

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceCubit, EcommerceState>(
        builder: (context, state) {
          final cubit = context.read<EcommerceCubit>();

          return Container(
            height: 550.h,
            width: 400.w,
            color: Colors.white,
            child: ListView.builder(
              itemCount: cubit.Ecomodel!.length,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      height: 100.h,
                      width: 55.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.Ecomodel![index].images!.length,
                        itemBuilder: (context, imageIndex) {
                          var imageUrl = cubit.Ecomodel![index].images![imageIndex];

                          // Clean the URL from the format ["https://..."]
                          if (imageUrl != null && imageUrl.isNotEmpty) {
                            imageUrl = imageUrl
                                .replaceAll("[", "")
                                .replaceAll("]", "")
                                .replaceAll("\"", ""); // Remove brackets and quotes

                            return Image.network(
                              imageUrl,
                              errorBuilder: (context, error, stackTrace) {
                                // In case of error, return SizedBox
                                return Image.asset('assets/images/logo1.png');
                              },
                            );
                          } else {
                            return SizedBox(
                              width: 55.w,
                              height: 100.h,
                            );
                          }
                        },
                      ),
                    ),
                    title: Text(
                      "Title: ${cubit.Ecomodel![index].title.toString()}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      maxLines: 3,
                      "${cubit.Ecomodel![index].description.toString()}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Text(
                      "${cubit.Ecomodel![index].price.toString()} \$",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        listener: (context, state) {});
  }
}
