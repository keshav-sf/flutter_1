import 'package:json_annotation/json_annotation.dart';

part 'req_signup_model.g.dart';

@JsonSerializable()
class ReqSignupModel {
  String? name;
  String? address;
  String? email;
  String? password;
  String? tradeName;
  String? commercialRegistration;
  String? vatNumber;

  ReqSignupModel(
      {this.name,
      this.address,
      this.email,
      this.password,
      this.tradeName,
      this.commercialRegistration,
      this.vatNumber});

  factory ReqSignupModel.fromJson(Map<String, dynamic> json) =>
      _$ReqSignupModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqSignupModelToJson(this);
}


// {
//     "name": "Testing",
//     "address": "Dubai",
//     "email": "tommy1@gmail.com",
//     "password": "Seaflux@123",
//     "trade_name": "Company Three",
//     "commercial_registration": "987654321",
//     "vat_number": "Tomm12356"
// }

// {
//     "data": {
//         "user": {
//             "id": 24,
//             "name": "Testing",
//             "email": "tommy1@gmail.com",
//             "address": "Dubai",
//             "trade_name": "Company Three",
//             "commercial_registration": 987654321,
//             "vat_number": "Tomm12356",
//             "image_url": null,
//             "is_active": true,
//             "created_at": "2024-02-13T11:50:52.964363Z",
//             "updated_at": "2024-02-13T11:50:52.964367Z"
//         },
//         "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImV4cCI6MTcxMDQxNzA1Mn0.GxyJm0KXlyLlngZkkdqDFOoU-wmY_xWL7bJf5VuFf_I"
//     },
//     "message": "تم تسجيل المستخدم بنجاح"
// }