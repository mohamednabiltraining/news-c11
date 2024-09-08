import 'package:news_app_c11_sun/api/ApiManager.dart';
import 'package:news_app_c11_sun/api/Result.dart';
import 'package:news_app_c11_sun/api/model/Source.dart';
import 'package:news_app_c11_sun/common/base/BaseState.dart';
import 'package:news_app_c11_sun/common/base/BaseViewModel.dart';

class CategoryDetailsViewModel extends BaseViewModel<List<Source>>{

  CategoryDetailsViewModel():super(LoadingState());

  void getNewsSources(String categoryId)async{

    emit(LoadingState());

      var result = await ApiManager.getSourcesByCategoryId(categoryId);

      switch(result){

        case Success<List<Source>>():{
          emit(SuccessState(result.data));
        }
        case ServerError<List<Source>>():{
         emit(ErrorState(serverError: result));
        }
        case Error<List<Source>>():{
          emit(ErrorState(error: result));
        }
      }
  }

}
