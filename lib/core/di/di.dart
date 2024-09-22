import 'package:get_it/get_it.dart';
import 'package:tasking/data/online/dio.dart';
import 'package:tasking/data/online/repo.dart';
import 'package:tasking/logic/get_product/cubit/get_data_cubit.dart';

GetIt di = GetIt.instance..allowReassignment = true;

Future init() async{
  di.registerFactory<DioHelper>(()=>DioImplementation());
  di.registerFactory<Repotisory>(()=>RepoImplementation(di<DioHelper>()));
  di.registerFactory<GetDataCubit>(()=>GetDataCubit(di<Repotisory>()));
}