import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool _testWidget = false;
  bool _imageWidget = false;
  bool _saveButton = false;

  bool get testWidget => _testWidget;
  bool get imageWidget => _imageWidget;
  bool get saveButton => _saveButton;

  updateValue(bool t, bool i, bool s) {
    _testWidget = t;
    _imageWidget = i;
    _saveButton = s;
    notifyListeners();
  }
}
