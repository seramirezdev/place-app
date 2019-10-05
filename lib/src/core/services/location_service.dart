import 'dart:async';

import 'package:location/location.dart';
import 'package:places/src/core/entities/user_location.dart';

class LocationService {
  LocationService() {
    requesPermission();
  }

  void requesPermission() {
    _location.requestPermission().then((granted) {
      if (granted) {
        _location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(
              UserLocation(
                latitude: locationData.latitude,
                longitude: locationData.longitude,
              ),
            );
          }
        });
      }
    });
  }

  final _location = Location();

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get locatoinStram => _locationController.stream;
}
