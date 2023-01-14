import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urun_katalog_projesi_piton/bloc/Register_state.dart';
import 'package:urun_katalog_projesi_piton/data/app_exceptions.dart';
import 'package:urun_katalog_projesi_piton/repositories/auth_repository.dart';

import '../res/utils.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  RegisterCubit(this._authRepository) : super(RegisterInitial());

  Future<void> register(String mail, String password, String name, BuildContext context) async {
    try {
      emit(RegisterLoading());
      var data ={};
      data["email"] = mail;
      data["name"] = name;
      data["password"] = password;
      await Future.delayed(Duration(milliseconds: 500));
      await _authRepository.registerApi(data).then((value) {
        emit(RegisterCompleted(value));
        print(value);
      }).onError((error, stackTrace){
        if(kDebugMode){
          print(error.toString());
        }
        emit(RegisterError(error.toString()));
      });

    } on FetchDataException catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}