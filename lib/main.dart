import 'core/app_imports/app_import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedprefHelper.initSharedprefHelper();
  await DioHelper.initDioHelper();
  setupGetIt();
  runApp(const MyApp());
}
