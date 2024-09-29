import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasking/logic/cubit/auth-cubit/auth_cubit.dart';
import '../../logic/cubit/products-cubit/ecommerce_cubit.dart';
import '../widgets/custom-app-bar.dart';
import '../widgets/custom-gridview.dart';
import '../widgets/custom-search-bar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceCubit, EcommerceState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(

            backgroundColor: Colors.black,
            body: state is EcommerceLoaded
                ? const Column(
              children: [
                CustomAppBar(),
                SizedBox(height: 10),
                CustomSearchBar(),
                SizedBox(height: 20,),
                CustomGridView(),

              ],
            )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
