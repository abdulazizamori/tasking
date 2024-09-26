import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';

class CustomGridProducts extends StatelessWidget {
  const CustomGridProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceCubit, EcommerceState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<EcommerceCubit>();
        return GridView.builder(
          itemCount: cubit.eComodel.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            var imageUrl = cubit.eComodel[index].images!.first;
            imageUrl = imageUrl
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll("\"", "");
            return Card(
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      ////////////////////////////////////////////////////////////////////////////
                      child: Image.network(
                        imageUrl,
                        height: 95.h,
                        width: 145.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cubit.eComodel[index].title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                              '${cubit.eComodel[index].price!.toString()} \$'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
