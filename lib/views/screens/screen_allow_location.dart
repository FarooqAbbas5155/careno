import 'package:careno/constant/button.dart';
import 'package:careno/constant/custom_button.dart';
import 'package:careno/constant/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenAllowLocation extends StatelessWidget {
  const ScreenAllowLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/current_location.png").marginSymmetric(vertical: 25.h),
            Center(
              child: RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "Allow ",
                    style: TextStyle(fontFamily: "UrbanistBold ",fontSize: 22.sp,fontWeight: FontWeight.w600,color: Colors.black),
                  ),
                  TextSpan(
                    text: '"Careno App"',
                    style: TextStyle(fontFamily: "UrbanistBold",fontSize: 22.sp,fontWeight: FontWeight.w600,color: primaryColor),
                  ),
                  TextSpan(
                    text: " to use",
                    style: TextStyle(fontFamily: "UrbanistBold ",fontSize: 22.sp,fontWeight: FontWeight.w600,color: Colors.black),
                  ),

                ]
              )),
            ),
            Center(child: Text("your Location", style: TextStyle(fontFamily: "UrbanistBold ",fontSize: 22.sp,fontWeight: FontWeight.w600,color: Colors.black),)),
            Text("Your precise location is used to show",style: TextStyle(color: Color(0xff393939),fontFamily: "Urbanist",fontSize: 18.sp),).marginSymmetric(horizontal: 10.w),
            Text("your position on the map, get",style: TextStyle(color: Color(0xff393939),fontFamily: "Urbanist",fontSize: 18.sp),).marginSymmetric(horizontal: 10.w),
            Text("  directions, estimate travel times, and ",style: TextStyle(color: Color(0xff393939),fontFamily: "Urbanist",fontSize: 18.sp),).marginSymmetric(horizontal: 10.w),
            Text("improve search results! ",style: TextStyle(color: Color(0xff393939),fontFamily: "Urbanist",fontSize: 18.sp),).marginSymmetric(horizontal: 10.w),
            CustomButton(title: "Allow", onPressed: (){},color: primaryColor,).marginSymmetric(vertical: 10.h),
            Button("Allow While Using App", () { }).marginSymmetric(vertical: 14.h),
            Button("Don't Allow", () {
              Get.back();
            }).marginSymmetric(vertical: 14.h)
          ],
        ),
      ),
    ));
  }
}
