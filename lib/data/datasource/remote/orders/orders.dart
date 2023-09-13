import 'package:admin/core/class/crud.dart';
import 'package:admin/data/static/applink.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  ordersDone(String ordersid, String userid, String orderstype) async {
    var response = await crud.postData(AppLinks.orderDone, {
      "orderid": ordersid.toString(),
      "userid": userid.toString(),
      "orders_type": orderstype.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  ordersViewPendingData(String adminId) async {
    var response = await crud.postData(AppLinks.ordersviewpending, {});

    return response.fold((l) => l, (r) => r);
  }

  ordersApproveData(String ordersid, String userid) async {
    var response = await crud.postData(AppLinks.orderApprove, {
      "orderid": ordersid.toString(),
      "userid": userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  ordersDetailsData(String ordersid) async {
    var response = await crud.postData(AppLinks.ordersDetails, {
      "ordersid": ordersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  ordersArchieveData(String userid) async {
    var response = await crud.postData(AppLinks.ordersArchieve, {});

    return response.fold((l) => l, (r) => r);
  }

  ordersAcceptedData(String id) async {
    var response = await crud.postData(AppLinks.ordersviewaccept, {});
    return response.fold((l) => l, (r) => r);
  }

  ordersPrepare(String ordersId, String userId, String ordersType) async {
    var response = await crud.postData(AppLinks.ordersviewaccept, {
      "orderid": ordersId.toString(),
      "userid": userId.toString(),
      "orders_type": ordersType.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
