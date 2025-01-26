
import 'package:final_project_amit62/core/app_imports/app_import.dart';
import 'package:final_project_amit62/features/auth/data/models/auth_response_model.dart';

class AuthRepository {
  final AuthWebServices _authWebServices;

  AuthRepository(this._authWebServices);

  Future<ApiResult<AuthResponseModel>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      var result = await _authWebServices.login(loginRequestBody);
      return ApiResult.success(AuthResponseModel.fromJson(result));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AuthResponseModel>> register(
      RegisterRequestBody registerRequestBody) async {
    try {
      var result = await _authWebServices.register(registerRequestBody);
      return ApiResult.success(AuthResponseModel.fromJson(result));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<TermsAndPrivacyModel>> setting() async {
    try {
      var result = await _authWebServices.setting();
      return ApiResult.success(TermsAndPrivacyModel.fromJson(result));
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
