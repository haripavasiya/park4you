import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../view/baseview/confirm_dialog_view.dart';


class AppConstants {

  static String appNAME = 'Park 4 You';
  static String baseURL = 'https://neo.dinjaninfotech.com/api/';
  static String sendOTP = 'SendOtp/';
  static String verifyOTP = 'verifyOTP/';
  static String checkNumber = 'CheckNumber/';
  static String registerAPI = 'Regs';
  static String signinAPI = 'signin';
  static String userdataAPI = 'userdata';
  static String accountAddAPI = 'userdata';

  static String THEME = 'theme';
  static String userToken = 'USER_TOKEN';
  static String deviceToken = 'Devices_Token';

  static Size screenSize= const Size(0.0,0.0);
  static double itemHeight=0.0;
  static double itemWidth=0.0;


  static closeKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static Future<bool> onWillPop(BuildContext context) {
    return showDialog<bool>(
        builder: (BuildContext context) {
          return ConfirmDialogView(
              description: "Do you really want to leave??",
              leftButtonText: "No",
              rightButtonText: "Yes",
              onAgreeTap: () {
                SystemNavigator.pop();
              });
        }, context: context).then((value) => value ?? false);
  }

  static bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  static showtoast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 14.0
    );
  }
}