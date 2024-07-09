import 'package:flutter/material.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';

class StickerSettings extends ChangeNotifier {
  LindiController controller = LindiController(
    borderColor: Colors.black,
    iconColor: Colors.white,
    showDone: true,
    showClose: true,
    showFlip: true,
    showStack: true,
    showLock: true,
    showAllBorders: true,
    shouldScale: true,
    shouldRotate: true,
    shouldMove: true,
    minScale: 0.5,
    maxScale: 4,
  );

  void addSticker(Widget widget) {
    controller.addWidget(widget);
    notifyListeners();
  }

  void removeAllStickers() {
    notifyListeners();
  }
}
