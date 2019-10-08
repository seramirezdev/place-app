import 'package:get_it/get_it.dart';
import 'package:places/src/core/providers/place_provider.dart';
import 'package:places/src/core/repositories/place_repository.dart';
import 'package:places/src/core/repositories/user_repository.dart';
import 'package:places/src/core/services/local_storage_service.dart';
import 'package:places/src/core/services/location_service.dart';
import 'package:places/src/core/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  var localStorageInstance = await LocalStorageService.getInstance();

  locator.registerLazySingleton(() => localStorageInstance);
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LocationService());

  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => PlaceRepository());
  
  locator.registerLazySingleton(() => PlaceProvider());
}
