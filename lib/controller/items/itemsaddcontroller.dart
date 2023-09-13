import 'dart:io';

import 'package:admin/controller/categories/categoriesviewcontroller.dart';
import 'package:admin/controller/items/itemsviewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/fileupload.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/categories.dart';
import 'package:admin/data/datasource/remote/items.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController {
  late TextEditingController dropdownid;
  late TextEditingController dropdownname;
  late TextEditingController name;
  late TextEditingController nameArabic;
  late TextEditingController description;
  late TextEditingController descriptionArabic;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController catid;
  late TextEditingController catname;
  File? imageFile;
  StatuesRequest statuesRequest = StatuesRequest.none;
  ItemsData itemsData = ItemsData(crud: Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<SelectedListItem> dropdownlist = [];

  getData() async {
    CategoriesData categoriesData = CategoriesData(crud: Get.find());

    statuesRequest = StatuesRequest.loading;
    update();
    var response = await categoriesData.getData();
    print("======================Controller ${response}");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response["status"] == "success") {
        List<CategoriesModel> data = [];
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId!));
          print(data[i].categoriesName!);
        }
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  @override
  addItems() async {
    if (formstate.currentState!.validate()) {
      if (imageFile == null) Get.snackbar("Warning", "please Choose Image Svg");
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await itemsData.addData(
          name.text,
          nameArabic.text,
          description.text,
          descriptionArabic.text,
          count.text,
          price.text,
          discount.text,
          catid.text,
          imageFile!);
      print("Response==>${response}");
      statuesRequest = await handlingData(response);

      if (StatuesRequest.success == statuesRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.itemsView);
          ItemsViewController itemsViewController = Get.find();
          itemsViewController.getData();
        } else {
          Get.defaultDialog(title: "48".tr, middleText: "52".tr);
          statuesRequest = StatuesRequest.failure;
        }
      }

      update();
    }
  }

  showOptionimage() {
    showbottommenu(() => chooseCamera(), () => chooseImage());
  }

  chooseImage() async {
    imageFile = await fileUploadGallery();
    update();
  }

  chooseCamera() async {
    imageFile = await imageUploadCamera();
    update();
  }

  @override
  void onInit() {
    getData();
    name = TextEditingController();
    nameArabic = TextEditingController();
    description = TextEditingController();
    descriptionArabic = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    dropdownid = TextEditingController();
    dropdownname = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    nameArabic.dispose();
    description.dispose();
    descriptionArabic.dispose();
    count.dispose();
    price.dispose();
    discount.dispose();
    catid.dispose();
    catname.dispose();
    super.dispose();
  }
}
