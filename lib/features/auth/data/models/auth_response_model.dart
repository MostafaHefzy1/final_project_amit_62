import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  bool? status;
  String? message;
  Data? data;

  AuthResponseModel({this.data, this.message, this.status});
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  String? token;

  Data({this.token});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
