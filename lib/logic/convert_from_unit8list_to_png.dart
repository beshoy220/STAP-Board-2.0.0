import 'package:image/image.dart' as img;
import 'dart:typed_data';

//
//
// NOT WORKING AND RUNS WITH ERROR.
//
//
Uint8List convertFromUnit8ListYoPNG(
    Uint8List uint8List1, Uint8List uint8List2) {
  // Decode the images from the Uint8List
  img.Image image1 = img.decodeImage(uint8List1)!;
  img.Image image2 = img.decodeImage(uint8List2)!;

  // Create a new image with dimensions that can hold both images side by side
  int combinedWidth = image1.width + image2.width;
  int combinedHeight =
      image1.height > image2.height ? image1.height : image2.height;

  img.Image combinedImage = img.Image(combinedWidth, combinedHeight);

  // Draw the first image onto the combined image
  img.copyInto(combinedImage, image1, blend: false);

  // Draw the second image onto the combined image, offset by the width of the first image
  img.copyInto(combinedImage, image2, dstX: image1.width, blend: false);

  // Encode the combined image to PNG
  Uint8List png = Uint8List.fromList(img.encodePng(combinedImage));

  return png;
}



  // Uint8List combinedPng = combineImages(uint8List1, uint8List2);

  // Save the combined PNG to a file
  // File('path_to_save_combined_image.png').writeAsBytesSync(combinedPng);

