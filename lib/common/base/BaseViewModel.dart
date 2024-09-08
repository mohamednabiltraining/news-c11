import 'package:flutter/material.dart';
import 'package:news_app_c11_sun/common/base/BaseState.dart';

class BaseViewModel<T> extends ChangeNotifier{
  BaseUIState<T> state;
  BaseViewModel(this.state);
  void emit(BaseUIState<T> newState){
    this.state = state;
    notifyListeners();
  }
}