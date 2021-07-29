import 'dart:io';

import 'package:file_picker/file_picker.dart';


class PickImages{
  static Future<MyResponse> onMultiPicker(
      {FileType type,
        List<String> allowedExtension,
        allowMultiple = true}) async {
    MyResponse res;
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(
// type: FileType.custom,
        type: type,
        allowedExtensions: allowedExtension,
        allowMultiple: true,
        allowCompression: false,
      );
      if (result != null) {
        res = MyResponse(
          success: true,
          message: 'File picked',
          data: result,
        );
        return res;
      } else {
        return res = MyResponse(
          success: true,
          message: 'No image selected',
        );
      }
    } catch (e) {
      print('Functions.onMultiPicker: exception: $e');
      res = new MyResponse(success: false, message: e.toString());
      return res;
    }
  }

  static List<File> toImageFile(FilePickerResult result) {
    List<File> files = [];
    if (result != null) {
      List<PlatformFile> platformFiles = result.files;

      platformFiles.forEach((plf) {
        files.add(File(plf.path));
      });
      return files;
    } else {
      return [];
    }
  }
}

class MyResponse {
  bool success;
  String message;
  var data;

  MyResponse({
    this.success = false,
    this.message = 'No data',
    this.data,
  });
}