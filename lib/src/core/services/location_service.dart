import 'dart:async';

import 'package:location/location.dart';
import 'package:places/src/core/entities/user_location.dart';

class LocationService {
  LocationService() {
    requestPermission();
  }

  final _location = Location();

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get locatoinStram => _locationController.stream;

  void requestPermission() {
    _location.requestPermission().then((granted) {
      if (granted) {
        startLocationListener();
      } else {
        throw Exception(
            "No se obtuvieron los permisos para acceder a al localización");
      }
    });
  }

  void startLocationListener() {
    _location.onLocationChanged().listen(updateLocation);
  }

  void updateLocation(LocationData locationData) {
    if (locationData != null) {
      _locationController.add(UserLocation(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
      ));
    }
  }
}
