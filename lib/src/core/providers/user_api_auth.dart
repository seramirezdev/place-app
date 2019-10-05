import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:places/src/core/constants/endpoints.dart';
import 'package:places/src/core/entities/user.dart';
import 'package:places/src/core/utils/headers_api.dart';

const endpointRegister = "$urlService/register";

class UserApiAuth {
  Future<User> signInWithCredential(User credentials) async {
    var user;

    try {
      final response = await http.post(endpointRegister,
          body: credentials.toJson(), headers: HeadersAPI.headers(false));

      if (response.statusCode == 200) {
        user = User.fromJson(json.decode(response.body));
      } else {
        return Future.error("Credenciales inválidas");  
      }
    } catch (ex) {
      return Future.error("Error en la petición al servidor");
    }

    return user;
  }
}
