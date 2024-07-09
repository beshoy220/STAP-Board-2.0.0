import 'package:flutter/material.dart';

class DrawerIndex extends ChangeNotifier {
  int drawerIndex = 0;
  void setDrawerIndex(index) {
    drawerIndex = index;
    notifyListeners();
  }
}
