import 'package:places/src/core/providers/place_provider.dart';
import 'package:places/src/locator.dart';
import 'package:provider/provider.dart';

import 'package:places/src/core/providers/auth_provider.dart';

List<SingleChildCloneableWidget> providers = [
  ChangeNotifierProvider(
    builder: (_) => AuthProvider(),
  ),
  ChangeNotifierProvider(
    builder: (_) => locator<PlaceProvider>(),
  ),
];
