import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/logic/cubit/auth-cubit/auth_cubit.dart';

import '../../core/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
      if (state is AuthInitial) {
        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeee');
        Navigator.pushReplacementNamed(context, 'Log_in');
      }
      },
      builder: (context, state) {
        return Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35.h,
                  width: 290.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)

                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5)),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Colors.black.withOpacity(0.5),
                        )),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    di<AuthCubit>().logout();
                    Navigator.pushReplacementNamed(context, 'Log_in');
                  },
                  icon: Icon(
                    Icons.list,
                    size: 40.sp,
                    color: Colors.white,
                  ))
            ],
          ),
        );
      },
    );
  }
}
