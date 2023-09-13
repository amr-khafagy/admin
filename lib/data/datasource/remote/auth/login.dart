
import 'package:admin/core/class/crud.dart';
import 'package:admin/data/static/applink.dart';

class LoginData {
  Crud crud;

  LoginData({required this.crud});

  postData(String password, String email) async {
    var response = await crud.postData(AppLinks.login, {
      "admin_password":password,
      "admin_email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
