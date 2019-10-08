import 'package:flutter/material.dart';
import 'package:places/src/public/pages/home/home_page.dart';
import 'package:places/src/public/pages/login/login_page.dart';
import 'package:places/src/public/pages/maps/maps_page.dart';
import 'package:places/src/public/pages/place/place_detail_page.dart';

class Routes {
  static const home = "home";
  static const login = "login";
  static const maps = "maps";
  static const detail = "detail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case maps:
        return MaterialPageRoute(builder: (context) => MapsPage());
      case detail:
        final place = settings.arguments;
        return MaterialPageRoute(builder: (context) => PlaceDetailtPage(place: place));
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
