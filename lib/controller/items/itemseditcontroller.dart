import 'dart:io';
import 'package:admin/controller/items/itemsviewcontroller.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/fileupload.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/categories.dart';
import 'package:admin/data/datasource/remote/items.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:admin/data/model/itemmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
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
  ItemsModel? itemsModel;
  List data = [];
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
        }
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  editItems() async {
    if (formstate.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await itemsData.editData(
          itemsModel!.itemsId!,
          name.text,
          nameArabic.text,
          description.text,
          descriptionArabic.text,
          count.text,
          price.text,
          discount.text,
          catid.text,
          itemsModel!.itemsImage!,
          imageFile);
      print("categories id:${itemsModel!.categoriesId}");
      statuesRequest = await handlingData(response);
      print("Response==>${response}");
      if (StatuesRequest.success == statuesRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.itemsView);
          ItemsViewController itemsView = Get.find();
          itemsView.getData();
        } else {
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
    itemsModel = Get.arguments['itemsModel'];
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
    name.text = itemsModel!.itemsName!;
    nameArabic.text = itemsModel!.itemsNameAr!;
    description.text = itemsModel!.itemsDesc!;
    descriptionArabic.text = itemsModel!.itemsDescAr!;
    count.text = itemsModel!.itemsCount!;
    price.text = itemsModel!.itemsPrice!;
    discount.text = itemsModel!.itemsDiscount!;
    catid.text = itemsModel!.categoriesId!;
    catname.text = itemsModel!.categoriesName!;
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
