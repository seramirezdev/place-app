import 'package:places/src/core/entities/place.dart';
import 'package:places/src/core/providers/base_provider.dart';
import 'package:places/src/core/repositories/place_repository.dart';
import 'package:places/src/locator.dart';

class PlaceProvider extends BaseProvider {
  PlaceProvider() {
    getPlaces();
  }

  final _placeRepository = locator<PlaceRepository>();

  List<Place> places = List();

  Future getPlaces() async {
    state = ViewState.busy;
    try {
      places = await _placeRepository.getPlaces();
    } catch (error) {
      this.error = error;
    }

    state = ViewState.idle;
  }
}
