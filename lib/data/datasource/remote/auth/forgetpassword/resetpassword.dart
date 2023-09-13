import 'package:admin/core/class/crud.dart';
import 'package:admin/data/static/applink.dart';

class ResetPasswordlData {
  Crud crud;

  ResetPasswordlData({required this.crud});

  postData(String email,String password) async {
    var response = await crud.postData(AppLinks.resetpassword, {
      "admin_email":email,
      "admin_password":password,
    });
    return response.fold((l) => l, (r) => r);
  }
}