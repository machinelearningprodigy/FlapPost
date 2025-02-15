import 'package:blogging_app/features/auth/domain/usecases/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignUp;
  AuthBloc({
    required UserSignup userSignup,
  }) : _userSignUp = userSignup,
     super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
     final res =  await _userSignUp(UserSignUpParameter(
        email: event.email, 
        name: event.name, 
        password: event.password,
      ));
      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (uid)=> emit(AuthSuccess(uid)),
        );
    });
  }
}
