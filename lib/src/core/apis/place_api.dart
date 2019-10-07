import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:places/src/core/constants/endpoints.dart';
import 'package:places/src/core/entities/place.dart';
import 'package:places/src/core/utils/headers_api.dart';

const endpointLogin = "$urlService/places";

class PlaceApi {
  Future<List<Place>> getPlaces() async {
    List<Place> places = List();
    try {
      final response = await http.get(endpointLogin,
          headers: HeadersAPI.headers(needJwtToken: true));

      if (response.statusCode == 200) {
        final resBody = json.decode(response.body);

        resBody.forEach((item) => places.add(Place.fromJson(item)));
      } else if (response.statusCode == 404) {
        return Future.error("Credenciales inválidas");
      } else if (response.statusCode == 500) {
        return Future.error("Problemas en el servidor");
      }
    } catch (ex) {
      return Future.error("Revisa tu conexión a internet");
    }

    return places;
  }
}
