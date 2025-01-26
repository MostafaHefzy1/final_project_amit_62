// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_privacy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermsAndPrivacyModel _$TermsAndPrivacyModelFromJson(
        Map<String, dynamic> json) =>
    TermsAndPrivacyModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TermsAndPrivacyModelToJson(
        TermsAndPrivacyModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      about: json['about'] as String?,
      terms: json['terms'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'about': instance.about,
      'terms': instance.terms,
    };
