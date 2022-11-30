part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserCredential userCredential;
  SignInSuccess({required this.userCredential});
}

class SignInFail extends SignInState {
  final String errorMessage;

  SignInFail({required this.errorMessage});
}
