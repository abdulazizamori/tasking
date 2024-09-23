part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class UserAuthSuccess extends AuthState{}

final class UserAuthFailure extends AuthState{
  UserAuthFailure(int? statusCode, data);
}

final class UserAuthError extends AuthState{
  UserAuthError(String string);
}
