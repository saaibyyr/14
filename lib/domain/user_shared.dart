import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future<void> saveUserDetails(String fullName, String phoneNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullName);
    await prefs.setString('phoneNumber', phoneNumber);
  }

  static Future<Map<String, String>> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String fullName = prefs.getString('fullName') ?? '';
    String phoneNumber = prefs.getString('phoneNumber') ?? '';
    return {'fullName': fullName, 'phoneNumber': phoneNumber};
  }

  static Future<void> clearUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('fullName');
    await prefs.remove('phoneNumber');
  }
}