import 'dart:io';

import 'package:dio/dio.dart';

import '../models/currency_model.dart';

class CurrencyServices{

  static  Future<List<CurrencyModel>> getCurrrensies() async{
  const String baseUrl="https://cbu.uz/oz";
    try{
   Response res = await Dio().get("$baseUrl/arkhiv-kursov-valyut/json/");
   switch(res.statusCode){
    case HttpStatus.ok:
    if(res.data is List) {
      return (res.data as List).map((e){
        return  CurrencyModel.fromJson(e);
      }).toList();
    }
    return [].cast<CurrencyModel>();


    default:
        return [].cast<CurrencyModel>();
   }

    }catch(e){
      if(e is DioError){
         print("ERROR: ${e.response!.data}");
      }
      throw Exception("ERROR WHILE GETTING DATAS FROM API");
    }

  }
}