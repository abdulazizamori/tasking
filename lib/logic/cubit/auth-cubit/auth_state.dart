part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class UserCreateSuccess extends AuthState {}

class UserCreateFailure extends AuthState {
  final int? statusCode;
  final dynamic message;

  UserCreateFailure(this.statusCode, this.message);
}

class UserCreateError extends AuthState {
  final String error;

  UserCreateError(this.error);
}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String token;
  AuthSuccess(this.token);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

class ImagePicked extends AuthState {
  final File imageFile;

  ImagePicked(this.imageFile);
}
