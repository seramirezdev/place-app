import 'package:flutter/material.dart';
import 'package:places/src/core/entities/place.dart';
import 'package:places/src/core/services/navigation_service.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/public/pages/place/widgets/place_comments.dart';
import 'package:places/src/public/pages/styles/colors_app.dart';
import 'package:places/src/public/pages/styles/dimens_app.dart';
import 'package:places/src/public/pages/styles/styles_app.dart';
import 'package:places/src/public/pages/styles/texts_app.dart';
import 'package:places/src/public/pages/widgets/background_app.dart';
import 'package:places/src/public/pages/widgets/place_carousel.dart';

class PlaceDetailtPage extends StatelessWidget {
  PlaceDetailtPage({Key key, this.place, this.isPage = true}) : super(key: key);

  final Place place;
  final bool isPage;

  @override
  Widget build(BuildContext context) {
    if (isPage) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              BackgroundApp(),
              _content(),
            ],
          ),
        ),
      );
    }

    return _content();
  }

  Widget _content() {
    return Container(
      padding: paddingHorizontalPage,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            if (isPage) SizedBox(height: 20),
            _getTitle(),
            _getImages(),
            _getDescription(),
            Container(
              child: PlaceComments(place: place),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTitle() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              place?.title ?? "",
              style: titleStyles,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: _roundedButton(),
        ),
      ],
    );
  }

  Widget _roundedButton() {
    return InkWell(
      onTap: _onClickGoBack,
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

  void _onClickGoBack() {
    locator<NavigationService>().goBack();
  }

  Widget _getDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(place?.location ?? "", style: locationStyle),
            Spacer(),
            Icon(Icons.star, color: itemStartRatingColor),
            SizedBox(width: 5),
            Text(place?.rating.toString() ?? "", style: textRatingPlace),
          ],
        ),
        Text(
          place?.description ?? "",
          style: textDescriptionPlace,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _getImages() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        clipBehavior: Clip.antiAlias,
        child: PlaceCarousel(images: place.images),
      ),
    );
  }
}
