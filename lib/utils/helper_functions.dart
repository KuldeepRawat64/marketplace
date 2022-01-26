import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static const _userNameKey = 'userName';
  static const _userEmailKey = 'userEmail';
  static const _userBirthdayKey = 'birthday';

  Future setUserName(String userName) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(_userNameKey, userName);
  }

  Future<String?> getUserName() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_userNameKey);
  }

  Future setEmail(String userEmail) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(_userEmailKey, userEmail);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(_userEmailKey);
  }

  Future setBirthday(DateTime dateOfBirth) async {
    final birthday = dateOfBirth.toIso8601String();
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(_userBirthdayKey, birthday);
  }

  Future<DateTime?> getBirthday() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final birthday = _prefs.getString(_userBirthdayKey);
    return birthday == null ? null : DateTime.tryParse(birthday);
  }
}
