import 'package:admin/controller/orders/acceptedprdercontroller.dart';
import 'package:admin/controller/orders/pendingordercontroller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/shared/appbar.dart';
import 'package:admin/view/widgets/orders/accepted/acceptedorders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptedOrders extends StatelessWidget {
  const AcceptedOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedOrdersController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AcceptedOrdersController>(builder: (controller) {
          return HandlingDataView(statuesRequest: controller.statuesRequest, widget:SingleChildScrollView(
            child: Column(
              children: [
                const  AdminAppBar(tittle: "Accepted Orders"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.ordersList.length,
                  itemBuilder: (context, index) {
                    return AcceptedOrdersCard(orderslistmodel: controller.ordersList[index]);
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

