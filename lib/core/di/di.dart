import 'package:get_it/get_it.dart';
import 'package:tasking/core/network/dio.dart';
import 'package:tasking/data/offline/cache_helper.dart';
import 'package:tasking/logic/cubit/auth-cubit/auth_cubit.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';
import '../../data/repo/repo.dart';

GetIt di = GetIt.instance..allowReassignment = true;

Future init() async{
  di.registerFactory<DioHelper>(()=>DioImplementation());
  di.registerFactory<Repository>(()=>RepoImplementation(di<DioHelper>()));
  di.registerFactory<EcommerceCubit>(()=>EcommerceCubit(di<Repository>()));
  di.registerFactory<AuthCubit>(()=>AuthCubit());
}