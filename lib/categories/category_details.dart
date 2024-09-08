import 'package:flutter/material.dart';
import 'package:news_app_c11_sun/api/ApiManager.dart';
import 'package:news_app_c11_sun/categories/CategoryDetailsViewModel.dart';
import 'package:news_app_c11_sun/common/LoadingStateWidget.dart';
import 'package:news_app_c11_sun/common/UIErrorWidget.dart';
import 'package:news_app_c11_sun/common/base/BaseState.dart';
import 'package:news_app_c11_sun/model/category.dart';
import 'package:news_app_c11_sun/tabs/tab_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails(this.category);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (_) => viewModel,
        builder: (context, child) {
          return Consumer<CategoryDetailsViewModel>(
            builder: (context, viewModel, child) {
              var state = viewModel.state;
              switch(state){
                case ErrorState():{
                  return ErrorStateWidget(
                    serverError: state.serverError,
                    error: state.error,
                  );
                }
                  case SuccessState():{
                    return TabWidget(state.data);
                  }
                case LoadingState():{
                  return LoadingStateWidget(state.message);
                }
              }

          },);

        });
  }
}
