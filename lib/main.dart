import 'package:flutter/material.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/place_app.dart';

Future<void> main() async {
  try {
    await setupLocator();
    runApp(PlaceApp());
  } catch (error) {
    print("Locator setup failed $error");
  }
}
