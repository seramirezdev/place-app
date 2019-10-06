import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:places/src/core/constants/endpoints.dart';
import 'package:places/src/core/entities/user.dart';
import 'package:places/src/core/utils/headers_api.dart';

const endpointLogin = "$urlService/login";

class UserAuthApi {
  Future<String> signInWithCredential(User credentials) async {
    String jwt;

    try {
      final response = await http.post(endpointLogin,
          body: json.encode(credentials.toJson()),
          headers: HeadersAPI.headers(needJwtToken: false));

      final resBody = response.body;

      if (response.statusCode == 200) {
        jwt = json.decode(resBody)["jwtKey"];
      } else if (response.statusCode == 404) {
        return Future.error("Credenciales inválidas");
      } else if (response.statusCode == 500) {
        return Future.error("Error desconocido en el servidor");
      }
    } catch (ex) {
      return Future.error("Error en la petición al servidor");
    }

    return jwt;
  }
}
