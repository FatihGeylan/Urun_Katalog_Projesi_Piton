import 'package:flutter/foundation.dart';
import 'package:urun_katalog_projesi_piton/models/auth_model.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginCompleted extends LoginState {
  final AuthModel response;

  const LoginCompleted(this.response);

  @override
  int get hashCode => response.hashCode;
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
}