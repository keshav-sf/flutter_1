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
  @JsonKey(name: "commercial_Registration")
  int? commercialRegistration;
  @JsonKey(name: "vat_Number")
  String? vatNumber;
  @JsonKey(name: "image_Url")
  String? imageUrl;
  @JsonKey(name: "is_Active")
  bool? isActive;
  @JsonKey(name: "created_At")
  String? createdAt;
  @JsonKey(name: "updated_At")
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.tradeName,
    this.commercialRegistration,
    this.vatNumber,
    this.imageUrl,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
