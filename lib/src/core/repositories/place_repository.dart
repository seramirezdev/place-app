import 'package:places/src/core/apis/place_api.dart';
import 'package:places/src/core/entities/place.dart';

class PlaceRepository {
  final _placeApi = PlaceApi();

  Future<List<Place>> getPlaces() async {
    try {
      return await _placeApi.getPlaces();
    } catch (error) {
      return Future.error(error.toString());
    }
  }
}
