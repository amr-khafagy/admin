import 'package:admin/controller/orders/acceptedprdercontroller.dart';
import 'package:admin/controller/orders/pendingordercontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/shared/appbar.dart';
import 'package:admin/view/widgets/orders/pending/orderscard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pending extends StatelessWidget {
  const Pending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PendingOrdersController>(builder: (controller) {
          return HandlingDataView(statuesRequest: controller.statuesRequest, widget:SingleChildScrollView(
            child: Column(
              children: [
                const  AdminAppBar(tittle: "Orders"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.ordersList.length,
                  itemBuilder: (context, index) {
                    return OrdersCard(orderslistmodel: controller.ordersList[index]);
                  },
                ),
              ],
            ),
          ));
        }),
      ),
    );
  }
}

