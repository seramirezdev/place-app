import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService() {
    if (_sharedPreferences == null) {
      initSharedPreferences();
    }
  }

  SharedPreferences _sharedPreferences;
  final String _kJWTToken = "jwtToken";
  final String _kIsLogged = "isLogged";

  void initSharedPreferences() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  set jwtToken(String jwtToken) =>
      _sharedPreferences.setString(_kJWTToken, jwtToken);

  String get jwtToken => _sharedPreferences.getString(_kJWTToken);

  set setLogged(bool logged) => _sharedPreferences.setBool(_kIsLogged, logged);

  bool get isLogged => _sharedPreferences.getBool(_kIsLogged);
}
