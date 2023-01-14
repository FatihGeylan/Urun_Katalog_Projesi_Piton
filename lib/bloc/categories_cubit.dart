import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urun_katalog_projesi_piton/bloc/categories_state.dart';
import 'package:urun_katalog_projesi_piton/repositories/categories_repository.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository _categoriesRepository;
  CategoriesCubit(this._categoriesRepository) : super(CategoriesInitial());

  Future<void> GetCategories() async {

    emit(CategoriesLoading());
    await Future.delayed(Duration(milliseconds: 500));
    await _categoriesRepository.FetchCategories().then((value) {
      emit(CategoriesCompleted(value));
    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
      emit(CategoriesError(error.toString()));
    });

  }
}