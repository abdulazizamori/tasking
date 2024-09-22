import 'package:dartz/dartz.dart';

abstract class AuthRepository{

  Future<Either> signup();
 
}
class AuthRepoImplementation extends AuthRepository{
  @override
  Future<Either> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }


}
