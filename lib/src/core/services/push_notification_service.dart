import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:places/src/core/services/local_storage_service.dart';
import 'package:places/src/locator.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void initNotification() async {
    _firebaseMessaging.requestNotificationPermissions();
    String token = await _firebaseMessaging.getToken();
    locator<LocalStorageService>().fcmToken = token;
    
    print(token);

    _configureNotification();
  }

  void _configureNotification() {
    _firebaseMessaging.configure(
      onMessage: (info) async {
        print("============on message============");
        print(info);
      },
      onLaunch: (info) async {
        print("============on launch============");
        print(info);
      },
      onResume: (info) async {
        print("============on resume============");
        print(info);
      }
    );
  }
}
