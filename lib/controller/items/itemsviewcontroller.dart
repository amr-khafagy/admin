import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/items.dart';
import 'package:admin/data/model/itemmodel.dart';
import 'package:get/get.dart';

class ItemsViewController extends GetxController {
  ItemsData itemsData = ItemsData(crud: Get.find());
  List<ItemsModel> data = [];
  late StatuesRequest statuesRequest;

  getData() async {
    data.clear();

    statuesRequest = StatuesRequest.loading;
    update();
    var response = await itemsData.getData();
    print("======================Controller ${response}");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  deleteCategories(String id, String imageName) async {
    data.clear();
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await itemsData.deleteData(id, imageName);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        refreshItems();
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  goToEdit(ItemsModel? itemsModel) {
    Get.toNamed(AppRoutes.itemsEdit, arguments: {"itemsModel": itemsModel});

  }

  refreshItems() {
    getData();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
