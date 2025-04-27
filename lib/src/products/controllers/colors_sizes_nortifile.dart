import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ColorSizeNortifile with ChangeNotifier {
  String _size = "";

  String get size => _size;

  void setSize(String size) {
    if (size != _size) {
      _size = "";
      notifyListeners();
    } else {
      _size = size;
      notifyListeners();
    }
  }

  String _color = "";

  String get color => _color;

  void setColor(String size) {
    if (color != _color) {
      _color = "";
      notifyListeners();
    } else {
      _color = color;
      notifyListeners();
    }
  }
}
