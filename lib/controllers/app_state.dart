import 'package:flutter/cupertino.dart';

/// Loading Controller
class App_state_controllers extends ChangeNotifier {
  bool _loading = false;
  bool get get_loader => _loading;
  set_loader(bool status) {
    _loading = status;
    notifyListeners();
  }
}
