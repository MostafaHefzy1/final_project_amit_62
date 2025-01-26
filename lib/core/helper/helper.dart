import 'package:final_project_amit62/core/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHelper {
  static toast({required String message, required ToastStatus status}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 4,
        backgroundColor:
            status == ToastStatus.error ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
