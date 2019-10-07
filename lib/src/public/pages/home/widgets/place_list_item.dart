import 'package:flutter/material.dart';
import 'package:places/src/core/constants/endpoints.dart';
import 'package:places/src/core/entities/place.dart';
import 'package:places/src/core/utils/headers_api.dart';
import 'package:places/src/public/pages/home/styles/text.dart';
import 'package:places/src/public/pages/styles/colors_app.dart';

class PlaceListItem extends StatelessWidget {
  PlaceListItem({place}) : _place = place;

  final Place _place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.only(bottom: 10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: <Widget>[
            _getImages(),
            _getOpacity(),
            _getDescription(),
          ],
        ),
      ),
    );
  }

  Widget _getImages() {
    final urlImage = "$endpointImages/${_place.images[2].path}";

    return Image(
      image: NetworkImage(
        urlImage,
        headers: HeadersAPI.headers(needJwtToken: true),
      ),
      fit: BoxFit.cover,
      width: double.infinity,
      loadingBuilder: (context, widget, loadingProgress) {
        if (loadingProgress == null) return widget;

        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
  }

  Widget _getOpacity() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.black.withOpacity(0.2),
        Colors.black.withOpacity(0.7),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }

  Widget _getDescription() {
    return Positioned(
      bottom: 10,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(_place.title, style: textItemTitlePlace),
          _getLocationAndRating(),
        ],
      ),
    );
  }

  Widget _getLocationAndRating() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(_place.location, style: textItemLocationPlace),
        Spacer(),
        Icon(Icons.star, color: itemStartRatingColor),
        SizedBox(width: 5.0),
        Text(_place.rating.toString(), style: textItemRatingPlace),
      ],
    );
  }
}
