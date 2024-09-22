import 'package:tasking/data/online/dio.dart';
import 'package:dio/dio.dart';
import 'package:tasking/data/online/endpoints.dart';

abstract class Repotisory{

  final DioHelper? dioHelper;

  Repotisory(this.dioHelper);

  Future<Response?> getAllData();

}

class RepoImplementation extends Repotisory{
  RepoImplementation(super.dioHelper);

  @override
  Future<Response?> getAllData() async{
    return await dioHelper?.getData(url: '$baseUrl = $endpoint');
  }








}