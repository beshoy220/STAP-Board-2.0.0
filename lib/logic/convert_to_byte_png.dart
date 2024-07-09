import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:stap_board/data/providers/paint_settings.dart';
import 'package:stap_board/data/providers/sticker_settings.dart';

Future<List<Uint8List?>> convertToUnit8List(
    PaintSettings paintSettings, StickerSettings stickerSettings) async {
  //Paint section converter to Unit8List
  var image = await paintSettings.painterControl.toImage(pixelRatio: 3.0);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List? pngBytes = byteData?.buffer.asUint8List();

  //Sticker section converter to Unit8List
  var pngBytes2 = await stickerSettings.controller.saveAsUint8List();

  if (pngBytes == null) {
    return [];
  } else {
    return [pngBytes, pngBytes2];
  }
}
