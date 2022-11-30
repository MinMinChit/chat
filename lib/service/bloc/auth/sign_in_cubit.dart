import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../firebase/firebase_auth.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final Auth auth;
  SignInCubit(this.auth) : super(SignInInitial());

  void signInWithEmailAndPassword(String email, String password) {
    emit(SignInLoading());
    auth.signInWithEmailAndPassword(email, password).then((value) {
      emit(SignInSuccess(userCredential: value));
    }).catchError((e) {
      emit(SignInFail(errorMessage: e.toString()));
    });
  }
}
