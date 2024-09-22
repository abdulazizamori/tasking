import 'package:dio/dio.dart';
import 'package:tasking/core/network/endpoints.dart';

abstract class AuthDioHelper{


  Future<Response> postData({required String url, dynamic data , String token});
  Future<Response> putData({required String url, dynamic data, String token});
  Future<Response> getData({required String url, dynamic data, String token,String param});
  Future<Response> deleteData({required String url, String token});
}

class AuthDioImplementation extends AuthDioHelper{
  final Dio authdio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          queryParameters: {},
          validateStatus: (statusCode){
            if (statusCode == null){
              return false;
            }
            if(statusCode == 422){
              return true;
            }
            else{
              return statusCode >= 200 && statusCode < 300;
            }
          }
      )
  );
  @override
  Future<Response> postData({String? url, String? token, dynamic data}) async {
    authdio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await authdio.post(url!, data: data, queryParameters: {});
  }

  @override
  Future<Response> putData({String? url, dynamic data, String? token}) async {
    authdio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await authdio.put(url!, data: data, queryParameters: {});
  }

  @override
  Future<Response> getData(
      {String? url, dynamic data, String? token, dynamic param}) async {
    authdio.options.headers = {
      'Authorization': 'Bearer $token',
      'accept': 'application/json'
    };
    return await authdio.get(
      url!,
      queryParameters: {},
    );
  }

  @override
  Future<Response> deleteData({String? url, String? token}) async {
    authdio.options.headers = {};

    return await authdio.delete(
      url!,
      queryParameters: {},
    );
  }



}
