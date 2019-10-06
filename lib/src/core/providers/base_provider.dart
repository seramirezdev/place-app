import 'package:flutter/foundation.dart';

enum ViewState { idle, busy }

class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
