import 'package:json_annotation/json_annotation.dart';

part 'res_signup_model.g.dart';

@JsonSerializable()
class ResSignupModel {
  Data? data;
  String? message;

  ResSignupModel({this.data, this.message});

  factory ResSignupModel.fromJson(Map<String, dynamic> json) =>
      _$ResSignupModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResSignupModelToJson(this);
}

@JsonSerializable()
class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? email;
  String? address;
  @JsonKey(name: "trade_name")
  String? tradeName;
  @JsonKey(name: "commercial_registration")
  int? commercialregistration;
  @JsonKey(name: "vat_number")
  String? vatnumber;
  @JsonKey(name: "image_url")
  String? imageurl;
  @JsonKey(name: "is_active")
  bool? isactive;
  @JsonKey(name: "created_at")
  String? createdat;
  @JsonKey(name: "updated_at")
  String? updatedat;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.tradeName,
    this.commercialregistration,
    this.vatnumber,
    this.imageurl,
    this.isactive,
    this.createdat,
    this.updatedat,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
