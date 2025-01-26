
import 'package:final_project_amit62/core/networking/error_model.dart';
import 'package:final_project_amit62/features/auth/data/models/auth_response_model.dart';

class AuthState {}

class AuthInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {
  final AuthResponseModel responseModel;

  LoginSuccessState(this.responseModel);  
}
class LoginFaileState extends AuthState {
  final ApiErrorModel apiErrorModel  ;

  LoginFaileState(this.apiErrorModel);
}


class RegisterLoadingState extends AuthState {}
class RegisterSuccessState extends AuthState {
  final AuthResponseModel responseModel;

  RegisterSuccessState(this.responseModel);  
}
class RegisterFaileState extends AuthState {
  final ApiErrorModel apiErrorModel  ;

  RegisterFaileState(this.apiErrorModel);
}


class GetSettingSuccessState extends AuthState {}
class GetSettingFaileState extends AuthState {
  final ApiErrorModel apiErrorModel  ;

  GetSettingFaileState(this.apiErrorModel);
}
