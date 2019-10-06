import 'package:flutter/material.dart';
import 'package:places/src/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  AuthProvider _authProvider;

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Bienvenido"),
            RaisedButton(
              onPressed: _onClickBtnLogout,
              child: Icon(Icons.exit_to_app),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickBtnLogout,
        child: Icon(Icons.exit_to_app),
      ),
    );
  }

  void _onClickBtnLogout() {
    _authProvider.logout();
  }
}
