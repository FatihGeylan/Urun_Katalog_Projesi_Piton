

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urun_katalog_projesi_piton/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {

  SplashCubit(): super(SplashInitial());

  Future<void> LeaveSplash() async {

    await Future.delayed(Duration(seconds: 3));
    emit(SplashCompleted());

  }
}