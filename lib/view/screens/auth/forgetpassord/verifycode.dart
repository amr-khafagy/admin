import 'package:admin/controller/auth/forgetpassword/verifycode.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widgets/login/bodytextauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllIMP controller = Get.put(VerifyCodeControllIMP());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "38".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: SingleChildScrollView(
          child:GetBuilder<VerifyCodeControllIMP>(builder: (controller){
            return HandlingDataView(statuesRequest: controller.statuesRequest, widget: Column(
              children: [

                BodyTextAuth(
                  bodytextauth: "39".tr,
                ),
                OtpTextField(
                  borderRadius: BorderRadius.circular(20),
                  fieldWidth: 50,
                  numberOfFields: 5,
                  borderColor:AppColor.primarycolor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    controller.gotoresetpassword(verificationCode);
                  }, // end onSubmit
                ),
              ],
            ),);
          },)
        ),
      )),
    );
  }
}
