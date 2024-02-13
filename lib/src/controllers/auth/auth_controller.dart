import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/apis/apimanagers/auth_api_manager.dart';
import 'package:flutter_boilerplate/src/base/utils/progress_dialog_utils.dart';
import 'package:flutter_boilerplate/src/models/auth/req_login_model.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';

class AuthController {
  // void loginApiCall({required BuildContext context}) async {
  //   final value = await locator<AuthApiManager>().login(ResBaseModel());
  //   logger(value.message ?? "");
  // }
  Future<void> loginApiCall(
      {required BuildContext context, required ReqLoginModel model}) async {
    ProgressDialogUtils.showProgressDialog();
    final response = await locator<AuthApiManager>().login(model);
    ProgressDialogUtils.dismissProgressDialog();
    // await setLoginData(response);
  }
}
