
import 'package:admin/core/class/crud.dart';
import 'package:admin/data/static/applink.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData({required this.crud});

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifycodeSignup, {
      "admin_email": email,
      "admin_verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
  resenddata(String email) async {
    var response = await crud.postData(AppLinks.resendcode, {
      "admin_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
