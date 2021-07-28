import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
Future<File> GetImage() async {
  final picker = ImagePicker();
  File _image;
  final pickedFile =
  await picker.getImage(source: ImageSource.camera, imageQuality: 70);
  if (pickedFile != null) {
    _image = File(pickedFile.path);
    return _image;
  } else {
    return null;
  }
}

Future<File> GetImageFromGallery() async {
  final picker = ImagePicker();
  File _image;
  final pickedFile =
  await picker.getImage(source: ImageSource.gallery, imageQuality: 70);
  if (pickedFile != null) {
    _image = File(pickedFile.path);
    return _image;
  } else {
    return null;
  }
}
Future<File> CropImage(BuildContext context,File imageFile) async {
  File croppedFile = await ImageCropper.cropImage(
      compressQuality: 25,
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'CROP',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true),
      iosUiSettings: IOSUiSettings(
        title: 'CROP',
      ));
  if (croppedFile != null) {
    return croppedFile;
  }
}
