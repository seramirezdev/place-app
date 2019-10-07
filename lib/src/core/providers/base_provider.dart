import 'package:flutter/foundation.dart';

enum ViewState { idle, busy }

class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  String _error = "";
  String get error => _error;

  bool _mounted = true;

  set error(String error) {
    _error = error;
    notifyListeners();
  }

  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (_mounted) super.notifyListeners();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
