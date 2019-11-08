import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class YSToast{
  static showInfo(String msg){
    Fluttertoast.showToast(
        msg: msg, gravity: ToastGravity.CENTER, textColor: Colors.white);
  }
}