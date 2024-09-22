import 'package:get_it/get_it.dart';
import 'package:tasking/data/online/dio.dart';
import 'package:tasking/data/online/repo.dart';
import 'package:tasking/logic/ecommerce_cubit.dart';

GetIt di = GetIt.instance..allowReassignment = true;

Future init() async{
  di.registerFactory<DioHelper>(()=>DioImplementation());
  di.registerFactory<Repotisory>(()=>RepoImplementation(di<DioHelper>()));
  di.registerFactory<EcommerceCubit>(()=>EcommerceCubit(di<Repotisory>()));
}