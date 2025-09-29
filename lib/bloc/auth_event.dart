part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginButtonRequested extends AuthEvent{
  final String email;
  final String password;

  LoginButtonRequested({
    required this.email,
    required this.password
  });

}