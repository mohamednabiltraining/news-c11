
import 'package:news_app_c11_sun/api/ApiManager.dart';
import 'package:news_app_c11_sun/api/Result.dart';
import 'package:news_app_c11_sun/api/model/News.dart';
import 'package:news_app_c11_sun/common/base/BaseState.dart';
import 'package:news_app_c11_sun/common/base/BaseViewModel.dart';

class NewsViewModel extends BaseViewModel<List<News>> {

  NewsViewModel():super(LoadingState());

  void getNewsBySourceId(String sourceId) async {
    emit(LoadingState());
    var result = await ApiManager.getNewsBySourceId(sourceId);
    switch(result){
      case Success<List<News>>():{
        emit(SuccessState(result.data));
      }
      case ServerError<List<News>>():{
        emit(ErrorState(serverError: result));
      }
      case Error<List<News>>():{
        emit(ErrorState(error: result));
      }
    }

  }
}