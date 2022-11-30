part of 'create_user_cubit.dart';

@immutable
abstract class CreateUserState {}

class CreateUserInitial extends CreateUserState {}

class CreateUserLoading extends CreateUserState {}

class CreateUserSuccess extends CreateUserState {
  final UserCredential userCredential;
  CreateUserSuccess({required this.userCredential});
}

class CreateUserFail extends CreateUserState {
  final String errorMessage;

  CreateUserFail({required this.errorMessage});
}

class SetUpUserLoading extends CreateUserState {}

class SetUpUserSuccess extends CreateUserState {}

class SetUpUserFail extends CreateUserState {
  final String errorMessage;

  SetUpUserFail({required this.errorMessage});
}
