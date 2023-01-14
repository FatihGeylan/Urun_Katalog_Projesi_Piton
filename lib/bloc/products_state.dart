import 'package:urun_katalog_projesi_piton/models/products_model.dart';

abstract class ProductsState {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsCompleted extends ProductsState {
  final ProductListModel response;

  const ProductsCompleted(this.response);

  @override
  int get hashCode => response.hashCode;
}

class ProductsError extends ProductsState {
  final String message;
  const ProductsError(this.message);
}