import 'package:flutter/material.dart';
import 'package:places/src/core/entities/user.dart';
import 'package:places/src/core/providers/auth_provider.dart';
import 'package:places/src/core/providers/base_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  AuthProvider _authProvider;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _createTextFormField(
                    controller: _usernameController,
                    label: "Usuario",
                    validator: _validateUsernameText,
                    focus: _usernameFocus,
                  ),
                  _createTextFormField(
                    controller: _passwordController,
                    label: "Contraseña",
                    validator: _validatePasswordText,
                    focus: _passwordFocus,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: _clickBtnLogin,
                      child: Text("Iniciar Sesión"),
                    ),
                  ),
                  if (_authProvider.error.isNotEmpty) Text(_authProvider.error),
                  if (_authProvider.state == ViewState.busy)
                    CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createTextFormField(
      {controller, focus, validator, label, isSecret = false}) {
    return TextFormField(
      controller: controller,
      focusNode: focus,
      obscureText: isSecret,
      validator: validator,
      decoration: InputDecoration(labelText: label),
    );
  }

  String _validateUsernameText(String value) {
    if (value.isEmpty) {
      return "Debes ingresar un nombre de usuario";
    }

    return null;
  }

  String _validatePasswordText(String value) {
    if (value.isEmpty) {
      return "Debes ingresar una contraseña";
    }

    return null;
  }

  void _clickBtnLogin() {
    if (_formKey.currentState.validate()) {
      final credentials = User(
        username: _usernameController.text,
        password: _passwordController.text,
        fcmToken: "tokenGenerate",
      );
      _authProvider.loginUser(credentials);
    }
  }
}
