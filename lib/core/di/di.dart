import 'package:get_it/get_it.dart';
import 'package:tasking/core/network/products/dio.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';

import '../../data/repo/products-repo/repo.dart';

GetIt di = GetIt.instance..allowReassignment = true;

Future init() async{
  di.registerFactory<DioHelper>(()=>DioImplementation());
  di.registerFactory<Repotisory>(()=>RepoImplementation(di<DioHelper>()));
  di.registerFactory<EcommerceCubit>(()=>EcommerceCubit(di<Repotisory>()));
}