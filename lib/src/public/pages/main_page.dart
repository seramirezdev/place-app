import 'package:flutter/material.dart';
import 'package:places/src/core/services/local_storage_service.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/public/pages/home/home_page.dart';
import 'package:places/src/public/pages/login/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (locator<LocalStorageService>().isLogged) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
