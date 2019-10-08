import 'package:flutter/material.dart';
import 'package:places/src/public/pages/styles/texts_app.dart';

class Loading extends StatelessWidget {
  Loading({final this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(message, style: loadingStyle),
          SizedBox(height: 20.0),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
