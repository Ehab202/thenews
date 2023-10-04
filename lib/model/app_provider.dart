import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier {
  bool isArEnable = false;

  changeCurrantLocala(bool newValue) async {
    isArEnable = newValue;
    notifyListeners();
  }
}