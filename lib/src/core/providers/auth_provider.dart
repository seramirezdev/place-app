import 'dart:async';

import 'package:places/src/core/entities/user.dart';
import 'package:places/src/core/providers/base_provider.dart';
import 'package:places/src/core/repositories/user_repository.dart';
import 'package:places/src/core/services/navigation_service.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/routes.dart';

class AuthProvider extends BaseProvider {
  String error = "";
  final _userRepository = locator<UserRepository>();

  Future loginUser(User credentials) async {
    state = ViewState.busy;
    try {
      bool hasUser = await _userRepository.loginUser(credentials);

      if (hasUser) {
        locator<NavigationService>().navigateTo(Routes.home, pop: true);
      }
    } catch (error) {
      this.error = error.toString();
      print(error);
    }

    state = ViewState.idle;
  }

  void logout() async {
    await _userRepository.logout();
    locator<NavigationService>().navigateTo(Routes.login, pop: true);
  }
}
