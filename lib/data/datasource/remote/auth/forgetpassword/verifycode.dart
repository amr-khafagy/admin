import 'package:admin/core/class/crud.dart';
import 'package:admin/data/static/applink.dart';

class VerifyCodeData {
  Crud crud;

  VerifyCodeData({required this.crud});

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifycode, {
      "admin_email": email,
      "admin_verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}