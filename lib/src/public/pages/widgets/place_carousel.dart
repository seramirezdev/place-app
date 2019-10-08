import 'package:flutter/material.dart';
import 'package:places/src/core/constants/endpoints.dart';
import 'package:places/src/core/entities/image.dart' as img;
import 'package:places/src/core/utils/headers_api.dart';

class PlaceCarousel extends StatelessWidget {
  PlaceCarousel({this.images});

  final List<img.Image> images;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Stack(
            children: <Widget>[
              _getImage(index),
              _getOpacity(),
            ],
          );
        },
      ),
    );
  }

  Widget _getImage(index) {
    final urlImage = "$endpointImages/${images[index].path}";
    return Image(
      image: NetworkImage(urlImage,
          headers: HeadersAPI.headers(needJwtToken: true)),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: _loadingImage,
    );
  }

  Widget _getOpacity() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.2),
          Colors.black.withOpacity(0.7),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );
  }

  Widget _loadingImage(_, widget, loadingProgress) {
    if (loadingProgress == null) return widget;

    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes
            : Text("Obteniendo imagen..."),
      ),
    );
  }
}
