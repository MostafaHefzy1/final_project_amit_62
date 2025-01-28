import 'package:final_project_amit62/core/helper/sharedpref_helper.dart';
import 'package:final_project_amit62/core/networking/dio_helper.dart';
import 'package:final_project_amit62/features/auth/data/models/login_request_body.dart';
import 'package:final_project_amit62/features/auth/data/models/register_request_body.dart';
import 'package:final_project_amit62/features/auth/data/models/terms_and_privacy_model.dart';
import 'package:final_project_amit62/features/auth/data/repository/auth_repository.dart';
import 'package:final_project_amit62/features/auth/logic/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitialState());

  void login(LoginRequestBody loginRequestBody) async {
    emit(LoginLoadingState());
    final result = await _authRepository.login(loginRequestBody);
    result.when(success: (respons) {
      if (respons.status!) {
        saveTokenAfterLoginAndRegister(respons.data!.token ?? "");
      }
      emit(LoginSuccessState(respons));
    }, failure: (error) {
      emit(LoginFaileState(error));
    });
  }

  void register(RegisterRequestBody registerRequestBody) async {
    emit(RegisterLoadingState());
    final result = await _authRepository.register(registerRequestBody);
    result.when(success: (respons) {
      if (respons.status!) {
        saveTokenAfterLoginAndRegister(respons.data!.token ?? "");
      }
      emit(RegisterSuccessState(respons));
    }, failure: (error) {
      emit(RegisterFaileState(error));
    });
  }

  saveTokenAfterLoginAndRegister(String token) async {
    SharedprefHelper.setSecuredString(key: "token", value: token);
    await DioHelper.initDioHelper();
  }

  TermsAndPrivacyModel? termsAndPrivacyModel;
  void setting() async {
    final result = await _authRepository.setting();
    result.when(success: (respons) {
      termsAndPrivacyModel = respons;
      emit(GetSettingSuccessState());
    }, failure: (error) {
      emit(GetSettingFaileState(error));
    });
  }
}
