import 'dart:convert';

import 'package:http/http.dart';
import 'package:urun_katalog_projesi_piton/models/auth_model.dart';
import 'package:urun_katalog_projesi_piton/models/register_model.dart';

import '../constants/app_url.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class AuthRepository  {

  BaseApiServices _apiServices = NetworkApiService() ;


  Future<dynamic> loginApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response = AuthModel.fromJson(response);

    }catch(e){
      throw e ;
    }
  }

  Future<dynamic> registerApi(dynamic data )async{

    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response = RegisterModel.fromJson(response);

    }catch(e){
      throw e ;
    }
  }


}