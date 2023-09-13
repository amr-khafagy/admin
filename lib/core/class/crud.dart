import 'dart:convert';
import 'dart:io';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/function/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
String _basicAuth='Basic${base64Encode(utf8.encode('ddddd:asdasdasd'))}';
Map<String,String> _myheaders={"authorization":_basicAuth};
class Crud {
  Future<Either<StatuesRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print("Status Code${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print("Response Body:${responsebody}");
        return Right(responsebody);
      } else {
        return const Left(StatuesRequest.serverfailure);
      }
    } else {
      return const Left(StatuesRequest.offlinefailure);
    }
  }
Future<Either<StatuesRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatuesRequest.serverfailure);
    }
  }
}
