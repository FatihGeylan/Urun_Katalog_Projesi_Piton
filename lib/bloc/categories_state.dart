import 'package:urun_katalog_projesi_piton/models/categories_model.dart';

abstract class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

class CategoriesCompleted extends CategoriesState {
  final CategoryListModel response;

  const CategoriesCompleted(this.response);

  @override
  int get hashCode => response.hashCode;
}

class CategoriesError extends CategoriesState {
  final String message;
  const CategoriesError(this.message);
}