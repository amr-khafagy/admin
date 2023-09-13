import 'dart:io';

import 'package:admin/controller/categories/categoriesviewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/fileupload.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CategoriesAddController extends GetxController {
  late TextEditingController name;
  late TextEditingController nameArabic;
   File? imageFile;
  StatuesRequest statuesRequest = StatuesRequest.none;
  CategoriesData categoriesData = CategoriesData(crud: Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List data = [];

  @override
  addCategories() async {
    if (formstate.currentState!.validate()) {
      if(imageFile==null) Get.snackbar("Warning","please Choose Image Svg");
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await categoriesData.addData(
          name.text, nameArabic.text,imageFile!);
      statuesRequest = await handlingData(response);
      print("Response==>${response}");
      if (StatuesRequest.success == statuesRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.categoriesView);
          CategoriesViewController categoriesView=Get.find();
          categoriesView.getData();
        } else {
          Get.defaultDialog(title: "48".tr, middleText: "52".tr);
          statuesRequest = StatuesRequest.failure;
        }
      }

      update();
    }
  }

chooseImage()async{
    var status=await Permission.storage.status;
    print(status);
      imageFile = await fileUploadGallery();
    update();
}



  @override
  void onInit() {
    name = TextEditingController();
    nameArabic = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    nameArabic.dispose();
    super.dispose();
  }
}
