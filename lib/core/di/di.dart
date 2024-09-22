import 'package:get_it/get_it.dart';
<<<<<<< HEAD
import 'package:tasking/core/network/products/dio.dart';
import 'package:tasking/logic/cubit/products-cubit/ecommerce_cubit.dart';

import '../../data/repo/products-repo/repo.dart';
=======
import 'package:tasking/data/online/dio.dart';
import 'package:tasking/data/online/repo.dart';
import 'package:tasking/logic/get_product/cubit/get_data_cubit.dart';
>>>>>>> 53f5d8b3cfd20ffd4a961b07ee420b04e45e8ab6

GetIt di = GetIt.instance..allowReassignment = true;

Future init() async{
  di.registerFactory<DioHelper>(()=>DioImplementation());
  di.registerFactory<Repotisory>(()=>RepoImplementation(di<DioHelper>()));
  di.registerFactory<GetDataCubit>(()=>GetDataCubit(di<Repotisory>()));
}