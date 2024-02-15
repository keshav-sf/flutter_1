import 'package:json_annotation/json_annotation.dart';

part 'res_dashboard_model.g.dart';

@JsonSerializable()
class ResDashboardModel {
  Data? data;
  String? message;

  ResDashboardModel({this.data, this.message});

  factory ResDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$ResDashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResDashboardModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "total_income")
  double? totalIncome;
  @JsonKey(name: "total_invoices")
  TotalInvoices? totalInvoices;
  int? total;

  Data({this.totalIncome, this.totalInvoices, this.total});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class TotalInvoices {
  int? unpaid;
  int? paid;

  TotalInvoices({
    this.unpaid,
    this.paid,
  });

  factory TotalInvoices.fromJson(Map<String, dynamic> json) =>
      _$TotalInvoicesFromJson(json);

  Map<String, dynamic> toJson() => _$TotalInvoicesToJson(this);
}
