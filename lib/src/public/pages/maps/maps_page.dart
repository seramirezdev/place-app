import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:places/src/core/entities/place.dart';
import 'package:places/src/core/entities/user_location.dart';
import 'package:places/src/core/providers/place_provider.dart';
import 'package:places/src/core/services/location_service.dart';
import 'package:places/src/locator.dart';
import 'package:places/src/public/pages/maps/widget/bottom_place_detail.dart';
import 'package:provider/provider.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  PlaceProvider _homeProvider;
  Place _placeDetail;
  double _bottomSize = 50;
  double _screenHeight;
  final double _defulatBottomSize = 50;

  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<PlaceProvider>(context);
    _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _getMap(),
            BottomPlaceDetail(
              place: _placeDetail,
              bottomSize: _bottomSize,
              updateSize: _updateSize,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getMap() {
    return StreamBuilder<UserLocation>(
      stream: locator<LocationService>().userLocation,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _loading();
        }

        final data = snapshot.data;
        final userPosition = LatLng(data.latitude, data.longitude);

        return GoogleMap(
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          onTap: (_) {
            _onTapMap();
          },
          onMapCreated: (onMapCreated) {
            _onMapCreated(onMapCreated, userPosition);
          },
          markers: _getMarkers()..add(_getUserMaker(userPosition)),
          initialCameraPosition: CameraPosition(
            target: userPosition,
            zoom: 12,
          ),
        );
      },
    );
  }

  Set<Marker> _getMarkers() {
    double hue = BitmapDescriptor.hueRed;
    return _homeProvider.places
        .map((place) => Marker(
              markerId: MarkerId(place.id.toString()),
              icon: BitmapDescriptor.defaultMarkerWithHue(hue),
              position: LatLng(place.latitude, place.longitude),
              onTap: () => _onTapMarker(place),
              infoWindow: InfoWindow(
                title: place.title,
                snippet: place.description,
              ),
            ))
        .toSet();
  }

  void _onTapMap() {
    setState(() {
      if (_placeDetail == null) {
        _bottomSize = _defulatBottomSize;
      } else {
        _bottomSize = 100;
      }
    });
  }

  void _onTapMarker(Place place) {
    setState(() {
      _placeDetail = place;
      _bottomSize = _screenHeight * 0.5;
    });
  }

  void _updateSize(value) {
    if (_placeDetail == null) return;

    setState(() {
      _bottomSize = _screenHeight - value.globalPosition.dy;
    });
  }

  Marker _getUserMaker(LatLng userPosition) {
    return Marker(
      markerId: MarkerId("user"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      position: userPosition,
      infoWindow: InfoWindow(
        title: "Tu ubicación",
      ),
    );
  }

  void _onMapCreated(GoogleMapController mapController, LatLng userPosition) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: userPosition, zoom: 12)));
  }

  Widget _loading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("Obteniendo ubicación..."),
          SizedBox(height: 20.0),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
