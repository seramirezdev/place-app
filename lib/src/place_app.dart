import 'package:flutter/material.dart';
import 'package:places/src/core/services/local_storage_service.dart';

import 'package:places/src/core/services/navigation_service.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/provider_setup.dart';
import 'package:places/src/routes.dart';
import 'package:provider/provider.dart';

const titleApp = "Places App";

class PlaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: titleApp,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.main,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
