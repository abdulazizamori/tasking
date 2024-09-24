import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';
import 'package:tasking/presentation/widgets/custom_home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceCubit, EcommerceState>(
      listener: (context, state) {},
      builder: (context, state) {
        // final cubit = context.read<EcommerceCubit>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/images/ecommerse.png'),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Store',
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          body: const CustomHomeBody(),
        );
      },
    );
  }
}
