
import 'package:final_project_amit62/core/app_imports/app_import.dart';

class AuthWebServices {
  Future<dynamic> login(LoginRequestBody loginRequestBody) async {
    var response = await DioHelper.postData(
        endpoint: loginEndPoint, data: loginRequestBody.toJson());
    return response.data;
  }

  Future<dynamic> register(RegisterRequestBody registerRequestBody) async {
    var response = await DioHelper.postData(
        endpoint: registerEndPoint, data: registerRequestBody.toJson());
    return response.data;
  }

  Future<dynamic> setting() async {
    var response = await DioHelper.getData(endpoint: settingsEndPoint);
    return response.data;
  }
}
