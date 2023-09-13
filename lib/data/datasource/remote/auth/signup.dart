import 'package:admin/core/class/crud.dart';
import 'package:admin/data/static/applink.dart';

class SignUpData {
  Crud crud;

  SignUpData({required this.crud});

  postData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLinks.signup, {
      "admin_name": username,
      "admin_password": password,
      "admin_email": email,
      "admin_phone": phone
    });
    print(username);
    return response.fold((l) => l, (r) => r);
  }
}
