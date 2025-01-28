import 'core/app_imports/app_import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedprefHelper.initSharedprefHelper();
  await DioHelper.initDioHelper();

  print("SharedprefHelper.getSecuredString  ${await SharedprefHelper.getSecuredString(key: "token")}");
  setupGetIt();
  runApp(const MyApp());
}
