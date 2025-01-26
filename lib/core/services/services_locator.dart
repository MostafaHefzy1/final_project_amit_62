import 'package:final_project_amit62/features/auth/data/repository/auth_repository.dart';
import 'package:final_project_amit62/features/auth/data/web_services/auth_web_services.dart';
import 'package:final_project_amit62/features/auth/logic/auth_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() async {
  getIt.registerFactory(() => AuthCubit(getIt()));
  getIt.registerLazySingleton(() => AuthRepository(getIt()));
  getIt.registerFactory(() => AuthWebServices());
}
