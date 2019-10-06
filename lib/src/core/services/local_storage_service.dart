import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  final String _kJWTToken = "jwtToken";
  final String _kIsLogged = "isLogged";

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  set jwtToken(String jwtToken) =>
      _preferences.setString(_kJWTToken, jwtToken);

  String get jwtToken => _preferences.getString(_kJWTToken);

  set setLogged(bool logged) => _preferences.setBool(_kIsLogged, logged);

  bool get isLogged => _preferences?.getBool(_kIsLogged) ?? false;
}
