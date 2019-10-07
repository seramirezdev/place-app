import 'package:flutter/material.dart';
import 'package:places/src/core/entities/place.dart';

class PlaceDetailtPage extends StatelessWidget {
  PlaceDetailtPage({Key key, this.place}) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      child: Column(
        children: <Widget>[
          _getTitle(),
          _getDescription(),
        ],
      ),
    );
  }

  Widget _getTitle() {
    return Center(
      child: Text(place?.title ?? ""),
    );
  }

  Widget _getDescription() {
    return Text(place?.description ?? "");
  }
}
