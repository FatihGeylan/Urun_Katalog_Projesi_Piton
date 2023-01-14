import 'package:urun_katalog_projesi_piton/models/product_image_model.dart';

abstract class ProductImageState {
  const ProductImageState();
}

class ProductImageInitial extends ProductImageState {
  const ProductImageInitial();
}

class ProductImageLoading extends ProductImageState {
  const ProductImageLoading();
}

class ProductImageCompleted extends ProductImageState {
  final ProductImageModel response;

  const ProductImageCompleted(this.response);

  @override
  int get hashCode => response.hashCode;
}

class ProductImageError extends ProductImageState {
  final String message;
  const ProductImageError(this.message);
}