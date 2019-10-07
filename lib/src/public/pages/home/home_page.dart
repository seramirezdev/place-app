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
      appBar: _toolbar(),
      body: SafeArea(
        child: Container(
          padding: paddingHorizontalPage,
          width: _screenSize.width,
          height: _screenSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: 10),
              Expanded(
                child: ListPlaces(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toolbar() {
    return AppBar(
      title: Text("Places App", style: titleStyles),
      actions: <Widget>[
        IconButton(
          onPressed: _onClickBtnShowMap,
          icon: Icon(Icons.map),
        ),
        IconButton(
          onPressed: _onClickBtnLogout,
          icon: Icon(Icons.exit_to_app),
        ),
      ],
    );

    /*return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Places-App", style: titleStyles),
            IconButton(
              onPressed: _onClickBtnLogout,
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
        SizedBox(height: 2.0),
        Container(
          width: 200,
          height: 2,
          decoration: BoxDecoration(
            color: titlesColor,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );*/
  }

  void _onClickBtnShowMap() {
    locator<NavigationService>().navigateTo(Routes.maps);
  }

  void _onClickBtnLogout() {
    _authProvider.logout();
  }
}
