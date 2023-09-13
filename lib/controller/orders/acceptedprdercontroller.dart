import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/orders/orders.dart';
import 'package:admin/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class AcceptedOrdersController extends GetxController {
  List<OrdersModel> ordersList = [];
  StatuesRequest statuesRequest = StatuesRequest.none;
  MyServices myServices = Get.find();
  OrdersData orders = OrdersData(Get.find());

  doneOrders(String ordersid, String userid,String orderType) async {
    ordersList.clear();
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await orders.ordersDone(ordersid, userid,orderType);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        refreshorders();
      } else {
        statuesRequest = StatuesRequest.failure;
      }
      update();
    }
  }
  getAcceptOrders() async {
    ordersList.clear();
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await orders
        .ordersAcceptedData(myServices.sharedPreferences.getString("id")!);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        ordersList.addAll(listdata.map((e) => OrdersModel.fromJson((e))));
      } else {
        statuesRequest = StatuesRequest.failure;
      }
      update();
    }
  }

  String ordersType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String paymentmethod(String val) {
    if (val == "0") {
      return "card";
    } else {
      return "cash";
    }
  }

  String ordersStatues(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The order is pending prepare";
    } else if (val == "2") {
      return "Ready to picked up by delivery man";
    } else if (val == "3") {
      return "on the way";
    } else {
      return "archieve";
    }
  }

  refreshorders() {
    getAcceptOrders();
  }

  @override
  void onInit() {
    getAcceptOrders();
    super.onInit();
  }
}
