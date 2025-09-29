import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginButtonRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;

        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(email)) {
          emit(AuthFailure('Please enter a valid email address'));
          return;
        }

        if (password.length < 6) {
          emit(AuthFailure('Password cannot be less than 6 characters'));
          return;
        }

        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthSuccess(uid: '$email-$password'));
        });
      } catch (e) {
         emit(AuthFailure(e.toString()));
      }
    });
  }
}
