import 'package:flutter/material.dart';
import 'package:places/src/public/pages/home_page.dart';
import 'package:places/src/public/pages/login/login_page.dart';

class Routes {
  static const home = "home";
  static const login = "login";
  static const maps = "maps";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("Page not found"),
            ),
          ),
        );
    }
  }
}
