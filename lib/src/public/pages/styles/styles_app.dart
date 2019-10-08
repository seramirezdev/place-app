import 'package:flutter/material.dart';
import 'package:places/src/public/pages/styles/colors_app.dart';

final appTheme = ThemeData(
  fontFamily: "Poppins-Regular",
  primaryColor: primaryColor,
  inputDecorationTheme: inputTheme,
);

final textTitlePlace = TextStyle(
    color: placeTitleColor, fontWeight: FontWeight.bold, fontSize: 28.0);

final textLocationPlace = TextStyle(
    color: placeLocationColor, fontSize: 16.0, fontFamily: "Poppins-Light");

final textDescriptionPlace = TextStyle(
  color: placeDescriptionColor,
  fontSize: 20.0,
  fontFamily: "Poppins-Light",
);

final textRatingPlace = TextStyle(
  color: placeDescriptionColor,
  fontSize: 20.0,
  fontFamily: "Poppins-Light",
);

final inputTheme = InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    gapPadding: 5,
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
);
