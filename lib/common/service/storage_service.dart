import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/values/constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  // this is a singleton i.e making sure your class is only one instance
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // method that helps us set values to our keys
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  // method to know the value after setting it check if it exist or return flase
  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }

  // function thatfinds the user key and remove 
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}

// this section talks more on shared preferencesand how to
// store a user informatoon so they don't keep going back to
// the log in or onboarding screen
