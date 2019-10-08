import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/src/core/providers/auth_provider.dart';
import 'package:places/src/core/providers/place_provider.dart';
import 'package:places/src/core/services/navigation_service.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/public/pages/home/widgets/list_places.dart';
import 'package:places/src/public/pages/styles/colors_app.dart';
import 'package:places/src/public/pages/styles/dimens_app.dart';
import 'package:places/src/public/pages/styles/texts_app.dart';
import 'package:places/src/public/pages/widgets/background_app.dart';
import 'package:places/src/routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthProvider _authProvider;
  Size _screenSize;

  @override
  void initState() {
    super.initState();
    locator<PlaceProvider>().getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    _screenSize = MediaQuery.of(context).size;

    return Consumer<PlaceProvider>(
      builder: (context, homeProvider, child) {
        return _homePage(context);
      },
    );
  }

  Widget _homePage(context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackgroundApp(),
            Container(
              padding: paddingHorizontalPage,
              width: _screenSize.width,
              height: _screenSize.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 20),
                  _getTopBar(),
                  SizedBox(height: 10),
                  Expanded(child: ListPlaces()),
                  SizedBox(height: 30),
                ],
              ),
            ),
            _getButtonGoMap(),
          ],
        ),
      ),
    );
  }

  Widget _getTopBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Places App", style: titleStyles),
            Text("Tu guía turística", style: subtitleStyles),
          ],
        ),
        _roundedButton(),
      ],
    );
  }

  Widget _getButtonGoMap() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: InkWell(
        onTap: _onClickBtnShowMap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                    spreadRadius: -5,
                    offset: Offset(-5, 5)),
              ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0))),
          child: Text("Ver Mapa", style: textButtonMap),
        ),
      ),
    );
  }

  Widget _roundedButton() {
    return InkWell(
      onTap: _onClickBtnLogout,
      child: Material(
        elevation: 10.0,
        shape: CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.close,
            color: primaryColor,
          ),
        ),
      ),
    );
  }

  void _onClickBtnShowMap() {
    locator<NavigationService>().navigateTo(Routes.maps);
  }

  void _onClickBtnLogout() {
    _authProvider.logout();
  }
}
