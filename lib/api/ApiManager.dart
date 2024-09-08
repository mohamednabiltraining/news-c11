import 'dart:convert';
import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_c11_sun/api/Result.dart';
import 'package:news_app_c11_sun/api/model/News.dart';
import 'package:news_app_c11_sun/api/model/Source.dart';
import 'package:news_app_c11_sun/api/model/responses/NewsResponse.dart';
import 'package:news_app_c11_sun/api/model/responses/SourcesResponse.dart';

class EndPoints{
  static const String SOURCES = "v2/top-headlines/sources";
  static const String NEWS = "v2/top-headlines";
}
class ApiManager{

  static const String BASE_URL = "newsapi.org";
  static const String API_KEY = "5909ae28122a471d8b0c237d5989cb73";
  static Future<Result<List<Source>>> getSourcesByCategoryId(String catId)async{
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
      if(sourcesResponse.status == 'ok'){
        // success
        return Success(data: sourcesResponse.sources ?? []);
      }else {
        // error
        return ServerError(sourcesResponse.code??"", sourcesResponse.message??"");
      }

    }on Exception catch(e){
      return Error(e);
    }

  }

  static Future<Result<List<News>>> getNewsBySourceId(String sourceId)async{
    var params = {
      "apiKey":API_KEY,
      "sources":sourceId
    };
    try {
      var url = Uri.https(BASE_URL, EndPoints.NEWS, params);
      var response = await http.get(url, headers: {"X-Api-Key": API_KEY});

      var json = jsonDecode(response.body);
      print("json : $json");
      var newsResponse = NewsResponse.fromJson(json);
      if (newsResponse.status == 'ok') {
        return Success(data: newsResponse.articles ?? []);
      }
      return ServerError(newsResponse.code ?? "", newsResponse.message ?? "");
    }on Exception catch(e){
      return Error(e);
    }
  }
}