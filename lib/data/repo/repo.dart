import 'package:tasking/core/network/dio.dart';
import 'package:dio/dio.dart';
import 'package:tasking/core/network/endpoints.dart';

abstract class Repository{

  final DioHelper? dioHelper;

  Repository(this.dioHelper);

  Future<Response?> getAllData();

}

class RepoImplementation extends Repository{
  RepoImplementation(super.dioHelper);

  @override
  Future<Response?> getAllData() async{
    return await dioHelper?.getData(url: baseUrl+endpoint);
  }



  }








