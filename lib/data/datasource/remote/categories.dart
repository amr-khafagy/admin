import 'dart:io';
import 'package:admin/core/class/crud.dart';
import 'package:admin/data/static/applink.dart';

class CategoriesData {
  Crud crud;

  CategoriesData({required this.crud});

  getData() async {
    var response = await crud.postData(AppLinks.categoriesView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(String name, String arabicname, File file) async {
    var response = await crud.addRequestWithImageOne(
        AppLinks.categoriesAdd, {"name": name, "name_ar": arabicname}, file);
    return response.fold((l) => l, (r) => r);
  }

  editData(String id, String name, String arabicName, String oldImage,
      [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLinks.categoriesEdit, {
        "id": id,
        "name": name,
        "name_ar": arabicName,
        "imageold": oldImage,
      });
    } else {
      response = await crud.addRequestWithImageOne(
          AppLinks.categoriesEdit,
          {
            "id": id,
            "name": name,
            "name_ar": arabicName,
            "files": oldImage,
          },
          file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id, String imageName) async {
    var response = await crud.postData(
        AppLinks.categoriesDelete, {"id": id, "imagename": imageName});
    return response.fold((l) => l, (r) => r);
  }
}
