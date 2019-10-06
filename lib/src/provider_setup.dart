import 'package:places/src/locator.dart';
import 'package:provider/provider.dart';

import 'package:places/src/core/providers/auth_provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
];

List<SingleChildCloneableWidget> independentServices = [
  ChangeNotifierProvider(
    builder: (_) => locator<AuthProvider>(),
  ),
];
