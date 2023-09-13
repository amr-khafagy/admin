import 'package:admin/controller/categories/categoriesviewcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/database_translation.dart';
import 'package:admin/core/shared/appbar.dart';
import 'package:admin/data/static/applink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.categoriesAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CategoriesViewController>(builder: (controller) {
        return HandlingDataView(
            statuesRequest: controller.statuesRequest,
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  AdminAppBar(tittle: "58".tr),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SvgPicture.network(
                                  "${AppLinks.imageServeCategories}/${controller.data[index].categoriesImage}",
                                  width: 50.w,
                                  height: 50.h,
                                ),
                                dataBaseTranslation(
                                    Text(
                                      controller.data[index].categoriesNameAr!,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      controller.data[index].categoriesName!,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                                Row(
                                  children: [
                                    Text(
                                      "59".tr,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(controller
                                        .data[index].categoriesDatattime!),
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: "60".tr,
                                        middleText:
                                            "61".tr,
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deleteCategories(
                                              controller
                                                  .data[index].categoriesId!,
                                              controller.data[index]
                                                  .categoriesImage!);
                                        });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    controller.goToEdit(controller.data[index]);
                                  },
                                 ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
