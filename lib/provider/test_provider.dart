import 'package:flutter/material.dart';

class TestProvider extends ChangeNotifier {
  int cartCount = 0;

  incrementCartCount() {
    cartCount += 1;
    notifyListeners();
  }
}
