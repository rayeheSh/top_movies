import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int pageIndex = 0;

  void changeNavIndex(int newIndex) {
    pageIndex = newIndex;

    notifyListeners();
  }
}
