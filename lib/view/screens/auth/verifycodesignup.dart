import 'package:admin/controller/auth/verifycodesignup.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widgets/login/bodytextauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllIMP());
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
        body: GetBuilder<VerifyCodeSignUpControllIMP>(builder: (controller) {
          return HandlingDataView(
              statuesRequest: controller.statuesRequest,
              widget: SafeArea(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BodyTextAuth(
                        bodytextauth: "39".tr,
                      ),
                      OtpTextField(
                        borderRadius: BorderRadius.circular(20),
                        fieldWidth: 50,
                        numberOfFields: 5,
                        borderColor: AppColor.primarycolor,
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.gotosuccesssignup(verificationCode);
                        }, // end onSubmit
                      ),
                     Center(
                       child: InkWell(
                         onTap: (){
                           controller.resendVerifycode();
                         },
                         child: const Text(
                            "Resend Verify Code",
                            style: TextStyle(
                                color: AppColor.favoritecolor,
                                fontSize:20,
                                fontWeight: FontWeight.bold),
                          ),
                       ),
                     )
                    ],
                  ),
                ),
              )));
        }));
  }
}
