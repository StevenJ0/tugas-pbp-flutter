import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

class ImageService {
  // Convert image file ke base64 (untuk mobile)
  String convertToBase64(File imageFile) {
    final bytes = imageFile.readAsBytesSync();
    return base64Encode(bytes);
  }

  // Convert bytes ke base64 (untuk web)
  String convertBytesToBase64(Uint8List bytes) {
    return base64Encode(bytes);
  }

  // Decode base64 ke bytes
  Uint8List decodeBase64(String base64String) {
    return base64Decode(base64String);
  }
}