import 'package:flutter/foundation.dart';
import 'package:urun_katalog_projesi_piton/models/auth_model.dart';
import 'package:urun_katalog_projesi_piton/models/register_model.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterCompleted extends RegisterState {
  final RegisterModel response;

  const RegisterCompleted(this.response);

  @override
  int get hashCode => response.hashCode;
}

class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);
}