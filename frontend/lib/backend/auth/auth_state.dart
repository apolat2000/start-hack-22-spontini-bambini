part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class UnauthenticatedState extends AuthState {}

class AuthenticatedState extends AuthState {
  final String jwt;

  AuthenticatedState(this.jwt);
}
