import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_chat_beta/model/user/user_model.dart';

import '../../firebase/firebase_auth.dart';
import '../../firebase/firebase_service.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  final Auth auth;
  final FirebaseApi api;
  CreateUserCubit(this.auth, this.api) : super(CreateUserInitial());

  void createUserWithEmailAndPassword(String email, String password) {
    emit(CreateUserLoading());
    auth.createUserWithEmailAndPassword(email, password).then((value) {
      emit(CreateUserSuccess(userCredential: value));
    }).catchError((e) {
      emit(CreateUserFail(errorMessage: e.toString()));
    });
  }

  void setUpAccount(SetupInputModel setupInputModel) async {
    emit(SetUpUserLoading());

    String result = await api.setupAnAccount(setupInputModel);

    if (result == 'Success') {
      emit(SetUpUserSuccess());
    } else {
      emit(SetUpUserFail(errorMessage: result));
    }
  }
}
