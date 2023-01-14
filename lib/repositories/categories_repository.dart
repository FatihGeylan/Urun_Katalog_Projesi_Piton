import 'dart:convert';

import 'package:http/http.dart';
import 'package:urun_katalog_projesi_piton/models/auth_model.dart';
import 'package:urun_katalog_projesi_piton/models/categories_model.dart';
import 'package:urun_katalog_projesi_piton/models/register_model.dart';

import '../constants/app_url.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../models/products_model.dart';

class CategoriesRepository  {

  BaseApiServices _apiServices = NetworkApiService() ;


  Future<CategoryListModel> FetchCategories() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.getAllCategoriesEndpoint);
      return response = CategoryListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


}