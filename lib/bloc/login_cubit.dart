import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urun_katalog_projesi_piton/bloc/login_state.dart';
import 'package:urun_katalog_projesi_piton/data/app_exceptions.dart';
import 'package:urun_katalog_projesi_piton/repositories/auth_repository.dart';

import '../res/utils.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(LoginInitial());

  Future<void> login(String mail, String password, BuildContext context) async {
    try {
      emit(LoginLoading());
      var data ={};
      data["email"] = mail;
      data["password"] = password;
      await Future.delayed(Duration(milliseconds: 500));
      await _authRepository.loginApi(data).then((value) {
        emit(LoginCompleted(value));
      }).onError((error, stackTrace){
        if(kDebugMode){
          print(error.toString());
        }
        emit(LoginError(error.toString()));
      });

    } on FetchDataException catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}