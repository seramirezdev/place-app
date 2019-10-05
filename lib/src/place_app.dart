import 'package:flutter/material.dart';
import 'package:places/src/core/services/navigation_service.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/routes.dart';

const titleApp = "Places App";

class PlaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleApp,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
