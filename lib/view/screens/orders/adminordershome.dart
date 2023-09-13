import 'package:admin/controller/orders/homescreen.dart';
import 'package:admin/view/widgets/orders/ordershome/ordershome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerIMP());
    return GetBuilder<HomeScreenControllerIMP>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: const CustomAppBarHome(),
              body: WillPopScope(
                onWillPop: () {
                  controller.onPop();
                  return Future.value(false);
                },
                child: controller.listpage.elementAt(controller.currentpage),
              ),
            ));
  }
}
