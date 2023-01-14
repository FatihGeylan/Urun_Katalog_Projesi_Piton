import 'dart:convert';

import 'package:http/http.dart';
import 'package:urun_katalog_projesi_piton/models/auth_model.dart';
import 'package:urun_katalog_projesi_piton/models/categories_model.dart';
import 'package:urun_katalog_projesi_piton/models/product_image_model.dart';
import 'package:urun_katalog_projesi_piton/models/register_model.dart';

import '../constants/app_url.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../models/products_model.dart';

class ProductsRepository  {

  BaseApiServices _apiServices = NetworkApiService() ;


  Future<ProductListModel> FetchProducts(int categoryId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.getProductsByCategoryId + '$categoryId');
      return response = ProductListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
  Future<dynamic> FetchPhoto(dynamic data )async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.getProductImage, data);
      return response = ProductImageModel.fromJson(response);

    }catch(e){
      throw e ;
    }
  }


}