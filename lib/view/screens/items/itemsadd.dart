import 'package:admin/controller/categories/categoriesaddcontroller.dart';
import 'package:admin/controller/items/itemsaddcontroller.dart';
import 'package:admin/core/function/fileupload.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/appbar.dart';
import 'package:admin/core/shared/customButton.dart';
import 'package:admin/core/shared/customdropdownlist.dart';
import 'package:admin/core/shared/globaltextfield.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddController());
    return GetBuilder<ItemsAddController>(builder: (controller) {
      return Scaffold(
        body: Form(
          key: controller.formstate,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              shrinkWrap: true,
              children: [
                const AdminAppBar(tittle: "Add new Items"),
                const SizedBox(
                  height: 20,
                ),
                GlobalTextfield(
                    textlabelauth: "Items name(EN)",
                    suffixiconauth: Icons.category,
                    hinttextauth: "Items name with English",
                    authcontroller: controller.name,
                    valid: (val) {
                      return validinput(val!, 1, 30, "");
                    },
                    keyboardtype: TextInputType.name),
                GlobalTextfield(
                    textlabelauth: "Items name(AR)",
                    suffixiconauth: Icons.category,
                    hinttextauth: "Items name with Arabic",
                    authcontroller: controller.nameArabic,
                    valid: (val) {
                      return validinput(val!, 1, 30, "");
                    },
                    keyboardtype: TextInputType.name),
                GlobalTextfield(
                    textlabelauth: "Items description(EN)",
                    suffixiconauth: Icons.category,
                    hinttextauth: "Items description with English",
                    authcontroller: controller.description,
                    valid: (val) {
                      return validinput(val!, 1, 200, "");
                    },
                    keyboardtype: TextInputType.name),
                GlobalTextfield(
                    textlabelauth: "Items description(AR)",
                    suffixiconauth: Icons.category,
                    hinttextauth: "Items description with Arabic",
                    authcontroller: controller.descriptionArabic,
                    valid: (val) {
                      return validinput(val!, 1, 200, "");
                    },
                    keyboardtype: TextInputType.name),
                GlobalTextfield(
                    textlabelauth: "Items Count",
                    suffixiconauth: Icons.category,
                    hinttextauth: "Items Count",
                    authcontroller: controller.count,
                    valid: (val) {
                      return validinput(val!, 1, 30, "");
                    },
                    keyboardtype: TextInputType.number),
                GlobalTextfield(
                    textlabelauth: "Items price",
                    suffixiconauth: Icons.category,
                    hinttextauth: "Items price",
                    authcontroller: controller.price,
                    valid: (val) {
                      return validinput(val!, 1, 30, "");
                    },
                    keyboardtype: TextInputType.number),
                GlobalTextfield(
                    textlabelauth: "Items Discount",
                    suffixiconauth: Icons.category,
                    hinttextauth: "Items Discount",
                    authcontroller: controller.discount,
                    valid: (val) {
                      return validinput(val!, 1, 30, "");
                    },
                    keyboardtype: TextInputType.number),
                CustomButton(
                  buttontext: "Upload Image of category",
                  onpressed: () {
                    controller.showOptionimage();
                  },
                ),
                CustomDropdownlist(
                    listdata: controller.dropdownlist,
                    title: "Choose Category",
                    dropdownSelectedname: controller.catname,
                    dropdownSelectedid: controller.catid),
                if (controller.imageFile != null)
                  Image.file(controller.imageFile!,
                      width: double.infinity.w, height: 300.h),
                CustomButton(
                  onpressed: () {
                    controller.addItems();
                  },
                  buttontext: "Add Item",
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
