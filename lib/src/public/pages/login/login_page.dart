import 'package:flutter/material.dart';
import 'package:places/src/core/entities/user.dart';
import 'package:places/src/core/providers/auth_provider.dart';
import 'package:places/src/core/providers/base_provider.dart';
import 'package:places/src/core/services/local_storage_service.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/public/pages/styles/colors_app.dart';
import 'package:places/src/public/pages/styles/styles_app.dart';
import 'package:places/src/public/pages/styles/texts_app.dart';
import 'package:places/src/public/pages/widgets/background_app.dart';
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
      body: Stack(
        children: <Widget>[
          BackgroundApp(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          "assets/images/icono.png",
                          width: 150,
                        ),
                      ),
                      SizedBox(height: 20),
                      _createTextFormField(
                        controller: _usernameController,
                        label: "Usuario",
                        validator: _validateUsernameText,
                        focus: _usernameFocus,
                      ),
                      SizedBox(height: 10),
                      _createTextFormField(
                        controller: _passwordController,
                        label: "Contraseña",
                        validator: _validatePasswordText,
                        isSecret: true,
                        focus: _passwordFocus,
                      ),
                      SizedBox(height: 10),
                      _getBtnLogin(),
                      SizedBox(height: 10),
                      if (_authProvider.error.isNotEmpty)
                        Text(_authProvider.error, style: textRatingPlace),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createTextFormField(
      {controller, focus, validator, label, isSecret = false}) {
    return Container(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Container(
          height: 70.0,
          padding: EdgeInsets.all(5.0),
          child: TextFormField(
            controller: controller,
            focusNode: focus,
            obscureText: isSecret,
            cursorColor: primaryColor,
            validator: validator,
            decoration: InputDecoration(
              hintText: label,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBtnLogin() {
    return InkWell(
      onTap: _authProvider.state == ViewState.busy ? null : _clickBtnLogin,
      child: Container(
        width: double.infinity,
        height: 70,
        child: Card(
          elevation: 4.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          color: primaryColor,
          child: Center(
            child: _authProvider.state == ViewState.idle
                ? Text("Iniciar Sesión", style: textButtonMap)
                : CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
          ),
        ),
      ),
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
    if (_authProvider.state == ViewState.busy) return;

    if (_formKey.currentState.validate()) {
      final credentials = User(
        username: _usernameController.text,
        password: _passwordController.text,
        fcmToken: locator<LocalStorageService>().fcmToken,
      );
      _authProvider.loginUser(credentials);
    }
  }
}
