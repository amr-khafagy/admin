import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/function/handlingdata.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControll extends GetxController {
  login();

  togoforgetpassword();

  togosignup();
}

class LoginControllIMP extends LoginControll {
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatuesRequest statuesRequest = StatuesRequest.none;
  LoginData loginData = LoginData(crud: Get.find());
  MyServices myServices = Get.find();

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      var response = await loginData.postData(password.text, email.text);
      statuesRequest = handlingData(response);

      if (StatuesRequest.success == statuesRequest) {
        if (response["status"] == "success") {
          if (response['data']['admin_approve'] == '1') {
            myServices.sharedPreferences
                .setString("id", response['data']['admin_id']);
            String userid=myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['admin_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['admin_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['admin_phone']);
            myServices.sharedPreferences.setString("step", '2');
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            Get.offNamed(AppRoutes.homepage);
          } else {
            Get.toNamed(AppRoutes.verifycodesignup,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(title: "48".tr, middleText: "51".tr);
          statuesRequest = StatuesRequest.failure;
        }
      }

      update();
    } else {}
  }

  @override
  togosignup() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  togoforgetpassword() {
    Get.offNamed(AppRoutes.forgetpassword);
  }

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
