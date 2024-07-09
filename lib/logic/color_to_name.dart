import 'package:flutter/material.dart';

String colorToName(Color color) {
  Map<int, String> colorNames = {
    Colors.black.value: 'Black',
    Colors.grey.value: 'Grey',
    Colors.red[900]!.value: 'Red',
    Colors.green[900]!.value: 'Green',
    Colors.blue[900]!.value: 'Blue',
    Colors.yellow[700]!.value: 'Yellow',
    Colors.pink[900]!.value: 'Vilote',
    Colors.brown.value: 'Brown',
  };

  // Check if the color value exists in the map
  if (colorNames.containsKey(color.value)) {
    return colorNames[color.value]!;
  } else {
    // If the color is not found in the map, return 'Unknown'
    return 'Unknown';
  }
}
