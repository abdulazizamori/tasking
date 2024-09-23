part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class UserAuthSuccess extends AuthState {}

class UserAuthFailure extends AuthState {
  final int? statusCode;
  final dynamic message;

  UserAuthFailure(this.statusCode, this.message);
}

class UserAuthError extends AuthState {
  final String error;

  UserAuthError(this.error);
}

class LoggedIn extends AuthState {}

class LoggedOut extends AuthState {}

class LoginError extends AuthState {
  final String error;

  LoginError(this.error);
}

class ImagePicked extends AuthState {
  final File imageFile;

  ImagePicked(this.imageFile);
}
