import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedprefHelper {
  static SharedPreferences? sharedprefHelper;

  static initSharedprefHelper() async {
    sharedprefHelper = await SharedPreferences.getInstance();
  }

  static saveData({required String key, required dynamic value}) async {
    if (value is String) return await sharedprefHelper?.setString(key, value);
    if (value is bool) return await sharedprefHelper?.setBool(key, value);
    if (value is int) return await sharedprefHelper?.setInt(key, value);
    return await sharedprefHelper?.setDouble(key, value);
  }

  static getData({required String key}) {
    return sharedprefHelper?.get(key);
  }

  static removeData({required String key}) {
    return sharedprefHelper?.remove(key);
  }

  static clearData() {
    return sharedprefHelper?.clear();
  }



  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString({required String key, required String value}) async {
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString({required String key}) async {
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? '';
  }
}
