import 'package:places/src/core/entities/user.dart';
import 'package:places/src/core/apis/user_auth_api.dart';
import 'package:places/src/core/services/local_storage_service.dart';
import 'package:places/src/locator.dart';

class UserRepository {
  final _userApiAuth = UserAuthApi();
  final _localStorageService = locator<LocalStorageService>();

  Future<bool> loginUser(User user) async {
    bool isLogged = false;

    try {
      String jwtKey = await _userApiAuth.signInWithCredential(user);

      _localStorageService.setLogged = true;
      _localStorageService.jwtToken = jwtKey;

      isLogged = true;
    } catch (error) {
      return Future.error(error);
    }

    return isLogged;
  }

  Future logout() async {
    _localStorageService.setLogged = false;
    _localStorageService.jwtToken = "";
  }
}
