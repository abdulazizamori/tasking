import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasking/core/di/di.dart';
import 'package:tasking/logic/cubit/auth-cubit/auth_cubit.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';
import 'package:tasking/presentation/screens/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasking/presentation/screens/product_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('auth_token');
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<EcommerceCubit>(
              create: (_) => di<EcommerceCubit>()..getEcommerceData(),
            ),
            BlocProvider<AuthCubit>(
              create: (_) => di<AuthCubit>(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter TASKAAAT',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const ProductDetailsScreen(),
            // initialRoute: (token != null ? 'Log_in' : 'home_page'),
            // routes: {
            //   'Log_in': (context) => const LoginScreen(),
            //   'product_details': (context) => const ProductDetailsScreen(),
            //   'register': (context) => const Registerpage(),
            //   'onboarding': (context) => const OnboardingScreen(),
            //   'home_page': (context) => const HomeScreen(),
            //   'splash': (context) => const SplashScreen(),
            // },
          ),
        );
      },
    );
  }
}
