import 'package:admin/core/constant/appimage.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/view/widgets/Home/homeadmincard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 150,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: [
                HomeAdminCard(
                  cardImage: AppImageAsset.homeNotification,
                  cardText: "55".tr,
                  onTap: () {},
                ),
                HomeAdminCard(
                  cardImage: AppImageAsset.homeProducts,
                  cardText: "54".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.itemsView);
                  },
                ),
                HomeAdminCard(
                  cardImage: AppImageAsset.homeUsers,
                  cardText: "53".tr,
                  onTap: () {},
                ),
                HomeAdminCard(
                  cardImage: AppImageAsset.homeCategories,
                  cardText: "58".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.categoriesView);
                  },
                ),
                HomeAdminCard(
                  cardImage: AppImageAsset.homeOrders,
                  cardText: "57".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.ordersHomeScreen);
                  },
                ),
                HomeAdminCard(
                  cardImage: AppImageAsset.homeReport,
                  cardText: "56".tr,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
