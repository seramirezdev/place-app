import 'package:get_it/get_it.dart';
import 'package:places/src/core/providers/auth_provider.dart';
import 'package:places/src/core/repositories/user_repository.dart';
import 'package:places/src/core/services/local_storage_service.dart';
import 'package:places/src/core/services/location_service.dart';
import 'package:places/src/core/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  var instance = await LocalStorageService.getInstance();

  locator.registerSingleton(instance);
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LocationService());

  locator.registerLazySingleton(() => UserRepository());

  locator.registerLazySingleton(() => AuthProvider());
}
