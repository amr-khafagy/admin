import 'dart:io';
import 'package:admin/core/shared/customButton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.gallery, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

showbottommenu(choosecamera(), chooseGallery()) {
  Get.bottomSheet(Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        child: Column(children: [
          CustomButton(
            buttontext: "From Camera",
            onpressed: () {
              choosecamera();
            },
          ),
          CustomButton(
            buttontext: "From Gallery",
            onpressed: () {
              chooseGallery();
            },
          ),
        ]),
      )));
}
