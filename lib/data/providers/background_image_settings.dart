import 'package:flutter/material.dart';

class BackgroundImageSettings extends ChangeNotifier {
  String backgroundImagePath = '';
  void changeBackground(String path) {
    backgroundImagePath = path;
    notifyListeners();
  }
}
