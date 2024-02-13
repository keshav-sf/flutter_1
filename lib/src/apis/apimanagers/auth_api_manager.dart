import 'package:flutter_boilerplate/src/models/auth/req_login_model.dart';
import 'package:flutter_boilerplate/src/models/auth/res_login_model.dart';

import '../../base/dependencyinjection/locator.dart';

import '../api_route_constant.dart';
import '../api_service.dart';

class AuthApiManager {
  Future<ResLoginModel> login(ReqLoginModel request) async {
    final response = await locator<ApiService>().post(
      apiLogin,
      data: request.toJson(),
    );
    return ResLoginModel.fromJson(response?.data);
  }
}
