import 'package:json_annotation/json_annotation.dart';

part 'req_login_model.g.dart';

@JsonSerializable()
class ReqLoginModel {
  String? username;
  String? password;

  ReqLoginModel({this.username, this.password});

  factory ReqLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ReqLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqLoginModelToJson(this);
}
