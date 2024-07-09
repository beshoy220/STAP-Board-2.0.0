import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

startUpWindowData() {
  const initialSize = Size(1000, 600);
  appWindow.minSize = initialSize;
  appWindow.size = initialSize;
  appWindow.alignment = Alignment.center;
  appWindow.show();
}
