import 'package:admin/controller/categories/categoriesaddcontroller.dart';
import 'package:admin/core/function/fileupload.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:admin/core/shared/appbar.dart';
import 'package:admin/core/shared/customButton.dart';
import 'package:admin/core/shared/globaltextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAddController());
    return GetBuilder<CategoriesAddController>(builder: (controller) {
      return Scaffold(
        body: Form(
          key: controller.formstate,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              shrinkWrap: true,
              children: [
                 AdminAppBar(tittle: "70".tr),
                const SizedBox(
                  height: 20,
                ),
                GlobalTextfield(
                    textlabelauth: "63".tr,
                    suffixiconauth: Icons.category,
                    hinttextauth: "64".tr,
                    authcontroller: controller.name,
                    valid: (val) {
                      return validinput(val!, 1, 30, "");
                    },
                    keyboardtype: TextInputType.name),
                GlobalTextfield(
                    textlabelauth: "65".tr,
                    suffixiconauth: Icons.category,
                    hinttextauth: "66".tr,
                    authcontroller: controller.nameArabic,
                    valid: (val) {
                      return validinput(val!, 1, 30, "");
                    },
                    keyboardtype: TextInputType.name),
                CustomButton(
                  buttontext: "67".tr,
                  onpressed: () {
                  controller.chooseImage();
                  },
                ),
                if(controller.imageFile!=null)
                  SvgPicture.file(controller.imageFile!,width:double.infinity.w,height: 300.h),
                CustomButton(
                  onpressed: () {
                    controller.addCategories();
                  },
                  buttontext: "68".tr,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
