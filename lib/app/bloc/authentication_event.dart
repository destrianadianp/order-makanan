//dasar kelas untuk perubahan status 
// import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];

}

class SignUpUser extends AuthenticationEvent {
  final String email;
  final String password;

  const SignUpUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LoginUser extends AuthenticationEvent{
  final String email;
  final String password;

  const LoginUser(
    {required this.email, 
    required this.password});

  @override
  List<Object> get props => [email, password];

 @override
  String toString() =>
  'LoginUser { email: $email, password: $password }';
}

class SignOut extends AuthenticationEvent {}