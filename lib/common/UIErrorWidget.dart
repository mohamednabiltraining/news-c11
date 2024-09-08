import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app_c11_sun/api/Result.dart';

class ErrorStateWidget extends StatelessWidget {
  ServerError? serverError;
  Error? error;
  String? retryButtonText;
  VoidCallback? retryButtonAction;

  ErrorStateWidget({this.serverError,this.error,
    this.retryButtonText,
    this.retryButtonAction

  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(extractErrorMessage()),
          retryButtonText !=null ? ElevatedButton(onPressed: retryButtonAction,
              child: Text(retryButtonText??""))
              :const Text('')
        ],
      ),
    );
  }
  String extractErrorMessage(){
    if(serverError?.message != null ){
      return serverError!.message;
    }
    if(error?.exception != null){
      var ex = error!.exception;
      switch(ex){
        case TimeoutException() :
        case SocketException() :{
          return "Please Check internet Connection";
        }
        default:{
          return "Something Went Wrong";
        }
      }
    }
    return "Something Went Wrong";
  }
}
