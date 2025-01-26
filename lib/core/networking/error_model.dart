import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String message;

  ApiErrorModel({required this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
