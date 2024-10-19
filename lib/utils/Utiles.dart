import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utiles{

  static const String baseurl = 'https://api.mazaddimashq.com';
}

void showToast({
  required String text,
  required ToastStates state,
  double fontsize = 25.0,
  int timeinsec = 5,
})=>Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,//ظهور
  timeInSecForIosWeb: timeinsec,
  backgroundColor: chooseToastColor(state),
  textColor: Colors.white,
  fontSize: fontsize,

);
enum ToastStates{
  SUCCESS,EROOR,WARNING
}
Color chooseToastColor(ToastStates state)
{  Color color;
switch(state){
  case ToastStates.SUCCESS:
    color= Colors.greenAccent;

    break;
  case ToastStates.EROOR:
    color=  Colors.redAccent;
    break;
  case ToastStates.WARNING:
    color=  Colors.amber;
    break;

}
return color;

}