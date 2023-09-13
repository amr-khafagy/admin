import 'dart:io';
import 'package:admin/core/class/crud.dart';
import 'package:admin/data/static/applink.dart';

class ItemsData {
  Crud crud;

  ItemsData({required this.crud});

  getData() async {
    var response = await crud.postData(AppLinks.itemsView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(
      String name,
      String arabicname,
      String desc,
      String arabicDesc,
      String count,
      String price,
      String discount,
      String cat,
      File file) async {
    var response = await crud.addRequestWithImageOne(
        AppLinks.itemsAdd,
        {
          "name": name,
          "name_ar": arabicname,
          "desc": desc,
          "desc_ar": arabicDesc,
          "count": count,
          "price": price,
          "discount": discount,
          "date": DateTime.now().toString(),
          "cat": cat,
        },
        file);
    print(
        "${name},${arabicname},${desc},${arabicDesc},${count},${price},${discount},${cat}");
    return response.fold((l) => l, (r) => r);
  }

  editData(
      String id,
      String name,
      String arabicname,
      String desc,
      String arabicDesc,
      String count,
      String price,
      String discount,
      String cat,
      String oldImage,
      [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLinks.itemsEdit, {
        "id": id,
        "name": name,
        "name_ar": arabicname,
        "desc": desc,
        "desc_ar": arabicDesc,
        "imageold": oldImage,
        "count": count,
        "price": price,
        "discount": discount,
        "date": DateTime.now().toString(),
        "cat": cat,
      });
    } else {
      response = await crud.addRequestWithImageOne(
          AppLinks.itemsEdit,
          {
            "id": id,
            "name": name,
            "name_ar": arabicname,
            "desc": desc,
            "desc_ar": arabicDesc,
            "count": count,
            "price": price,
            "discount": discount,
            "cat": cat,
            "date": DateTime.now().toString(),
            "res": file,
            "imageold": oldImage,
          },
          file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id, String imageName) async {
    var response = await crud
        .postData(AppLinks.itemsDelete, {"id": id, "imagename": imageName});
    return response.fold((l) => l, (r) => r);
  }
}
