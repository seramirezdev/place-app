import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateTo(String routeName, {bool pop = false, dynamic arguments}) {
    if (pop) {
      if (navigatorKey.currentState.canPop()) navigatorKey.currentState.pop();
    }
    navigatorKey.currentState.pushReplacementNamed(routeName, arguments: arguments);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }
}
