import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/data/datasource/remote/categories.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:get/get.dart';

class CategoriesViewController extends GetxController {
  CategoriesData categoriesData = CategoriesData(crud: Get.find());
  List<CategoriesModel> data = [];
  late StatuesRequest statuesRequest;

  getData() async {
    data.clear();

    statuesRequest = StatuesRequest.loading;
    update();
    var response = await categoriesData.getData();
    print("======================Controller ${response}");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
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
    var response = await categoriesData.deleteData(id, imageName);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        refreshCategorirs();
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }
goToEdit(CategoriesModel? categoriesModel){
    Get.toNamed(AppRoutes.categoriesEdit,arguments: {
      "categoriesModel":categoriesModel
    });
}
  refreshCategorirs(){
   getData();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
