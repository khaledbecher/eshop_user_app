
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showErrorToast({required String msg,Color?backgroundColor,Color?textColor}){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor??Colors.red,
      textColor:textColor?? Colors.white,
      fontSize: 16.0,
  );
}
void showInfoToast({required String msg,Color?backgroundColor,Color?textColor}){
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor??Colors.blueAccent,
    textColor:textColor?? Colors.white,
    fontSize: 16.0,
  );
}