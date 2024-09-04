import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_app_c11_sun/api/model/responses/NewsResponse.dart';
import 'package:news_app_c11_sun/api/model/responses/SourcesResponse.dart';

class EndPoints{
  static const String SOURCES = "v2/top-headlines/sources";
  static const String NEWS = "v2/top-headlines";
}
class ApiManager{

  static const String BASE_URL = "newsapi.org";
  static const String API_KEY = "5909ae28122a471d8b0c237d5989cb73";
  static Future<SourcesResponse?> getSourcesByCategoryId(String catId)async{
    var params = {
      "apiKey":API_KEY,
      "category":catId
    };
    var url = Uri.https(BASE_URL,EndPoints.SOURCES,params);
    try{
      var response = await http.get(url, headers: {"X-Api-Key":API_KEY});
      var json = jsonDecode(response.body);
      print("json : $json");
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;

    }on SocketException {

    } on HttpException {

    } on FormatException {
    }

    return null;
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
    var params = {
      "apiKey":API_KEY,
      "sources":sourceId
    };
    var url = Uri.https(BASE_URL,EndPoints.NEWS,params);
    try{
      var response = await http.get(url, headers: {"X-Api-Key":API_KEY});

      var json = jsonDecode(response.body);
      print("json : $json");
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;

    } on  SocketException {
      var message = "please check internet connection";

    } on HttpException catch(e){
    //  e.uri -> api link
    } on FormatException catch(e){

    }catch(e){
      // i don't know the reason of the exception
    }


    return null;
  }
}