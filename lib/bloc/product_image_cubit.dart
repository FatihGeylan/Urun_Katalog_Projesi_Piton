import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urun_katalog_projesi_piton/bloc/Products_state.dart';
import 'package:urun_katalog_projesi_piton/bloc/poduct_image_state.dart';
import 'package:urun_katalog_projesi_piton/data/app_exceptions.dart';
import 'package:urun_katalog_projesi_piton/repositories/products_repository.dart';

import '../res/utils.dart';

class ProductImageCubit extends Cubit<ProductImageState> {
  final ProductsRepository _productsRepository;
  ProductImageCubit(this._productsRepository) : super(ProductImageInitial());

  Future<void> GetProductImage(String coverName,) async {

    emit(ProductImageLoading());
    var data ={};
    data["fileName"] = coverName;
    await Future.delayed(Duration(milliseconds: 500));
    await _productsRepository.FetchPhoto(data).then((value) {
      emit(ProductImageCompleted(value));
    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
      emit(ProductImageError(error.toString()));
    });

  }
}