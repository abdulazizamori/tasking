import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasking/core/di/di.dart';
import 'package:tasking/logic/cubit/auth-cubit/auth_cubit.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';
import 'package:tasking/presentation/screens/home_screen.dart';
import 'package:tasking/presentation/screens/onboarding_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
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
            home: FlutterSplashScreen.fadeIn(
              duration: const Duration(milliseconds: 4000),
              backgroundColor: Colors.white,
              childWidget: Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/ecommerse.png",
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Ecommerse',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              onAnimationEnd: () => debugPrint("On Fade In End"),
              nextScreen: const HomeScreen(),
            ),
// routes: {
//   'register' : (context)=>
// },
          ),
        );
      },
    );
  }
}
