import 'dart:ui';

import 'package:careno/constant/button.dart';
import 'package:careno/constant/custom_button.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/controllers/home_controller.dart';
import 'package:careno/views/screens/screen_login.dart';
import 'package:careno/views/screens/screen_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class ScreenWelcome extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              height: 540.h,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login_image.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 460.h,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 4),
                      blurRadius: 50,
                      spreadRadius: 50,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/careno.png",).marginSymmetric(
                       vertical : 30.sp, horizontal: 15.sp),
                    Text("SignUp",style: TextStyle(color: Colors.black,fontSize: 26.sp,fontWeight: FontWeight.w700,fontFamily: "UrbanistBold"),).marginOnly(left: 14.w),
                    Obx(() {
                      return RadioListTile(
                          title: Text("As a Customer/User",
                            style: TextStyle(color: Colors.black,fontFamily: "UrbanistBold",fontWeight: FontWeight.w700,fontSize: 18.sp),),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: primaryColor,
                          value: "user",
                          groupValue: controller.userType.value,
                          onChanged: (String? value) {
                            controller.userType.value = value!;
                          });
                    }),
                    Obx(() {
                      return RadioListTile(
                          title: Text("As a Vehicle Company",
                            style: TextStyle(color: Colors.black,fontFamily: "UrbanistBold",fontWeight: FontWeight.w700,fontSize: 18.sp),),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: primaryColor,
                          value: "driver",
                          groupValue: controller.userType.value,
                          onChanged: (String? value) {
                            controller.userType.value = value!;
                          });

                    }),
                    Center(
                      child: CustomButton(
                        width: 310.w,
                        title: 'Next', onPressed: () {
                        Get.to(ScreenLogin());
                      },).marginSymmetric(vertical: 25.h),
                    ),

                    // Button(title: "Register", onPressed: (){
                    //   Get.to(ScreenSignup());
                    // })

                  ],
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
