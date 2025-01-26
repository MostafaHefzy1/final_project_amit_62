import 'package:freezed_annotation/freezed_annotation.dart';
part 'terms_and_privacy_model.g.dart';

@JsonSerializable()
class TermsAndPrivacyModel {
  Data? data;

  TermsAndPrivacyModel({this.data});

  factory TermsAndPrivacyModel.fromJson(Map<String, dynamic> json) =>
      _$TermsAndPrivacyModelFromJson(json);
}

@JsonSerializable()
class Data {
  String? about;
  String? terms;

  Data({this.about, this.terms});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
