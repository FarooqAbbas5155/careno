import 'package:careno/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ScreenHostDocuments extends StatelessWidget {
  const ScreenHostDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("My Documents"),
        elevation: 0,
      ),
      body: Column(children: [

        Container(
          width: Get.width,
          height: 35.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF0F0F0)
          ),
          child: Text("Insurance Certificate",style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700
          ),),
        ),

        CustomImage(
          name: "insurance-certificate",
        ).marginSymmetric(vertical: 20.h),
        Container(
          width: Get.width,
          height: 35.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF0F0F0)
          ),
          child: Text("National ID (Front)",style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700
          ),),
        ),

        CustomImage(
          name: "id-front",
        ).marginSymmetric(vertical: 20.h),
        Container(
          width: Get.width,
          height: 35.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF0F0F0)
          ),
          child: Text("National ID (Back)",style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700
          ),),
        ),

        CustomImage(
          name: "id-back",
        ).marginSymmetric(vertical: 20.h)
      ],),
    ));
  }
}
