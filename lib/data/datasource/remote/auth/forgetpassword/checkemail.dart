import 'package:admin/core/class/crud.dart';
import 'package:admin/data/static/applink.dart';

class CheckemailData {
  Crud crud;

  CheckemailData({required this.crud});

  postData(String email) async {
    var response = await crud.postData(AppLinks.checkemail, {
      "admin_email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
