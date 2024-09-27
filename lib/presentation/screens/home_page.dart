import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';
import 'package:tasking/presentation/widgets/custom_home_body.dart';

import '../../core/di/di.dart';
import '../../logic/cubit/auth-cubit/auth_cubit.dart';

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
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              'Store',
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.white,
              ),
            ),
          ),
          drawer: Drawer(
            backgroundColor: Colors.black,
            child: Column(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'Hello "user"',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 200.w,
                  child: ElevatedButton(
                    onPressed: () {
                      di<AuthCubit>().logout();
                      Navigator.pushReplacementNamed(context, 'Log_in');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 159, 26, 17),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
          body: state is EcommerceLoaded
              ? const CustomHomeBody()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
        );
      },
    );
  }
}
