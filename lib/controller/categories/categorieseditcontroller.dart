import 'dart:io';

import 'package:admin/controller/categories/categoriesviewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/fileupload.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/categories.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CategoriesEditController extends GetxController {
  late TextEditingController name;
  late TextEditingController nameArabic;
  File? imageFile;
  StatuesRequest statuesRequest = StatuesRequest.none;
  CategoriesData categoriesData = CategoriesData(crud: Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CategoriesModel? categoriesModel;
  List data = [];

  @override
  editCategories() async {
    if (formstate.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await categoriesData.editData(
          categoriesModel!.categoriesId!,
          name.text,
          nameArabic.text,
          categoriesModel!.categoriesImage!,
          imageFile);
      statuesRequest = await handlingData(response);
      print("Response==>${response}");
      if (StatuesRequest.success == statuesRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.categoriesView);
          CategoriesViewController categoriesView = Get.find();
          categoriesView.getData();
        } else {
          statuesRequest = StatuesRequest.failure;
        }
      }

      update();
    }
  }

  chooseImage() async {
    var status = await Permission.storage.status;
    print(status);
    imageFile = await fileUploadGallery();
    update();
  }

  @override
  void onInit() {
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    nameArabic = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    nameArabic.text = categoriesModel!.categoriesNameAr!;
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    nameArabic.dispose();
    super.dispose();
  }
}
