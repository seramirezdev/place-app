import 'package:places/src/core/services/local_storage_service.dart';
import 'package:places/src/locator.dart';

class HeadersAPI {
  static Map<String, String> headers(bool isPrivate) {
    var headers = Map<String, String>();
    headers["Content-Type"] = "application/json";

    if (isPrivate) {
      headers["Authorization"] =
          "Bearer ${locator<LocalStorageService>().jwtToken}";
    }

    return headers;
  }
}
