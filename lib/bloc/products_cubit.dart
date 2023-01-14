import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urun_katalog_projesi_piton/bloc/Products_state.dart';
import 'package:urun_katalog_projesi_piton/data/app_exceptions.dart';
import 'package:urun_katalog_projesi_piton/repositories/products_repository.dart';

import '../res/utils.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productsRepository;
  ProductsCubit(this._productsRepository) : super(ProductsInitial());

  Future<void> GetProducts(int categoryId,) async {

    emit(ProductsLoading());
    await Future.delayed(Duration(milliseconds: 2000));
    await _productsRepository.FetchProducts(categoryId).then((value) {
      emit(ProductsCompleted(value));
    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
      emit(ProductsError(error.toString()));
    });

  }
}