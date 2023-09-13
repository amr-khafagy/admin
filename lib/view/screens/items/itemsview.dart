import 'package:admin/controller/categories/categoriesviewcontroller.dart';
import 'package:admin/controller/items/itemsviewcontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/database_translation.dart';
import 'package:admin/core/shared/appbar.dart';
import 'package:admin/data/static/applink.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.itemsAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ItemsViewController>(builder: (controller) {
        return HandlingDataView(
            statuesRequest: controller.statuesRequest,
            widget: SingleChildScrollView(
              child: Column(
                children: [
                  const AdminAppBar(tittle: "Items"),
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
                                CachedNetworkImage(imageUrl:
                                  "${AppLinks.imageServeItems}/${controller.data[index].itemsImage}",
                                  width: 50.w,
                                  height: 50.h,
                                ),
                                dataBaseTranslation(
                                    Text(
                                      controller.data[index].itemsNameAr!,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      controller.data[index].itemsName!,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                                Row(
                                  children: [
                                    Text(
                                      "59".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(controller
                                        .data[index].itemsDate!),
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
                                            "72".tr,
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deleteCategories(
                                              controller
                                                  .data[index].itemsId!,
                                              controller.data[index]
                                                  .itemsImage!);
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
