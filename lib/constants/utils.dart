import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

// final image =
//     await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 15);
// if (image != null) {
//   images = File(image.path);
//}
Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var pickedFile = await ImagePicker().pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000
    );
    //List<XFile> xfilePick = pickedFile;
    if (pickedFile != null && pickedFile.isNotEmpty) {
      for (int i = 0; i < pickedFile.length; i++) {
        images.add(File(pickedFile[i].path));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
