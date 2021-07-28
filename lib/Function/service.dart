import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Service {
  Future<String> submitSubscription(
      {File file,
      String filename,
      String token,
      String type,
      String extension}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://codexiatech.dev/realestate/upload.php"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        // contentType: MediaType(type, extension),
      ),
    );
    request.headers.addAll(headers);
    request.fields
        .addAll({"name": "test", "email": "test@gmail.com", "id": "12345"});
    print("request: " + request.url.toString());

    var res = await request.send();
    print("This is response:" + res.toString());
    final respStr = await res.stream.bytesToString();
    List<String> values = [];
    print(respStr);
    Map<String, dynamic> map = jsonDecode(respStr);
    print(map["fileUrl"]);
    print(res.statusCode);
    return map["fileUrl"];
  }
}
Future<String> uploadimage(File filepath) async {
  String imgurl="";
  List<String> imageNameList = filepath.toString().split('/');
  imgurl = await Service().submitSubscription(
      file: filepath,
      filename: imageNameList[imageNameList.length - 1]
          .toString()
          .substring(
          0,
          imageNameList[imageNameList.length - 1].toString().length -
              1),
      token: "notoken",
      type: 'image',
      extension: 'jpg');
  print("uploaded");
  return imgurl;
}