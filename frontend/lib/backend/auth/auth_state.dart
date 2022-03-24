part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class UnauthenticatedState extends AuthState {}

class AuthenticatedState extends AuthState {
  final String jwt;

  String get publicID => "max-mustermann-123-456";
  User user = User(firstName: 'Max', lastName: "Mustermann");

  AuthenticatedState(this.jwt);
}
