import 'package:bloc/bloc.dart';

import 'package:order2/models/user.dart';
import 'package:order2/services/authentication.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';



class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService = AuthService();

  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
          final UserModel? user =
          await authService.signUpUser(event.email, event.password);
      if (user != null) {
        emit(AuthenticationSuccessState(user));

      } else {
        emit(const AuthenticationFailureState('create user failed'));
      }
      } catch (e) {
        print(e.toString());
      }
     emit(AuthenticationLoadingState(isLoading: false));
    });

on<LoginUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
          final UserModel? user =
          await authService.LoginUser(event.email, event.password);
      if (user != null) {
        emit(AuthenticationSuccessState(user));

      } else {
        emit(const AuthenticationFailureState('login failed'));
      }
      } catch (e) {
        print(e.toString());
      }
     emit(AuthenticationLoadingState(isLoading: false));
    });


     on<SignOut>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        authService.signOutUser();
      } catch (e) {
        print('error');
        print(e.toString());
      } 
       emit(AuthenticationLoadingState(isLoading: false));
     });
}
}