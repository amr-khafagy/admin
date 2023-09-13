import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAdminCard extends StatelessWidget {
  final String cardImage;
  final String cardText;
  final void Function()? onTap;

  const HomeAdminCard(
      {Key? key, required this.cardImage, required this.cardText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            cardImage,
            height: 75.h,
            width:75.w ,
          ),
          Text(
            cardText,
            style:  TextStyle(
                color: AppColor.primarycolor,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp),
          ),
        ],
      )),
    );
  }
}
