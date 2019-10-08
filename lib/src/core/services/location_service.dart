import 'dart:async';

import 'package:location/location.dart';
import 'package:places/src/core/entities/user_location.dart';

class LocationService {

  void initLocationListener() {
    _locationController = StreamController<UserLocation>.broadcast();
    _requestPermission();
  }

  final _location = Location();

  StreamController<UserLocation> _locationController;
  Stream<UserLocation> get userLocation => _locationController.stream;

  void _requestPermission() {
    _location.requestPermission().then((granted) {
      if (granted) {
        _startLocationListener();
      } else {
        throw Exception(
            "No se obtuvieron los permisos para acceder a al localización");
      }
    });
  }

  void _startLocationListener() {
    _location.onLocationChanged().listen(_updateLocation);
  }

  void _updateLocation(LocationData locationData) {
    if (!_locationController.isClosed) {
      _locationController.add(UserLocation(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
      ));
    }
  }

  void dispose() {
    _locationController.close();
  }
}
