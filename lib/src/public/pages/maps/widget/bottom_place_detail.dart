import 'package:flutter/material.dart';
import 'package:places/src/core/entities/place.dart';
import 'package:places/src/public/pages/place/place_detail_page.dart';

class BottomPlaceDetail extends StatefulWidget {
  BottomPlaceDetail({Key key, this.place, this.bottomSize, this.updateSize})
      : super(key: key);

  final Place place;
  final double bottomSize;
  final Function updateSize;

  @override
  _BottomPlaceDetailState createState() => _BottomPlaceDetailState();
}

class _BottomPlaceDetailState extends State<BottomPlaceDetail> {
  Size _screen;
  double _bottomSize;
  final double _defaultBottomSize = 50;

  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;
    _bottomSize = widget.bottomSize;

    return Positioned(
      bottom: 0,
      child: Container(
        child: GestureDetector(
          onVerticalDragUpdate: widget.updateSize,
          child: _animatedContainer(),
        ),
      ),
    );
  }

  Widget _animatedContainer() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: _screen.width,
      height: _bottomSize,
      constraints: BoxConstraints(
        minHeight: _defaultBottomSize,
        maxHeight: _screen.height * 0.85,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black,
              offset: Offset(0, 5),
              spreadRadius: -5,
            ),
          ]),
      child: _dynamicContent(),
    );
  }

  Widget _dynamicContent() {
    return Column(
      children: <Widget>[
        _separator(),
        Expanded(
          child: SingleChildScrollView(
              child: PlaceDetailtPage(place: widget.place, isPage: false)),
        ),
      ],
    );
  }

  Widget _separator() {
    return Container(
      width: 100,
      height: 10,
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
