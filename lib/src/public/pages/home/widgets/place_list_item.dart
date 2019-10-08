import 'package:flutter/material.dart';
import 'package:places/src/core/entities/place.dart';
import 'package:places/src/core/services/navigation_service.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/public/pages/home/styles/text.dart';
import 'package:places/src/public/pages/styles/colors_app.dart';
import 'package:places/src/public/pages/widgets/place_carousel.dart';
import 'package:places/src/routes.dart';

class PlaceListItem extends StatelessWidget {
  PlaceListItem({place}) : _place = place;

  final Place _place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: InkWell(
        onTap: _onClickOpenDetailImage,
        child: Card(
          elevation: 4.0,
          margin: EdgeInsets.only(bottom: 10.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              PlaceCarousel(images: _place.images),
              _getDescription(),
            ],
          ),
        ),
      ),
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

  void _onClickOpenDetailImage() {
    locator<NavigationService>().navigateTo(Routes.detail, arguments: _place);
  }
}
