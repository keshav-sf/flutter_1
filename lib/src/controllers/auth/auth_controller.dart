import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/apis/apimanagers/auth_api_manager.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/preference_key_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/preference_utils.dart';
import 'package:flutter_boilerplate/src/base/utils/progress_dialog_utils.dart';
import 'package:flutter_boilerplate/src/models/auth/req_login_model.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/models/auth/req_signup_model.dart';
import 'package:flutter_boilerplate/src/models/auth/res_dashboard_model.dart';
import 'package:flutter_boilerplate/src/models/auth/res_login_model.dart';

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

    await setLoginDataCall(response);
  }

  Future<ResDashboardModel> dashboardApiCall() async {
    // ProgressDialogUtils.showProgressDialog();
    final data = await locator<AuthApiManager>().dashboard();
    // ProgressDialogUtils.dismissProgressDialog();
    return data;
  }

  Future<void> setLoginDataCall(ResLoginModel data) async {
    await setString(prefkeyToken, data.data?.token ?? '');
  }

  Future<void> signupApiCall(
      {required BuildContext context, required ReqSignupModel model}) async {
    ProgressDialogUtils.showProgressDialog();
    await locator<AuthApiManager>().signup(model);
    ProgressDialogUtils.dismissProgressDialog();
    // await setLoginData(response);
  }
}
