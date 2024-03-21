import 'dart:ui';

import 'package:careno/constant/button.dart';
import 'package:careno/constant/custom_button.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/views/screens/screen_login.dart';
import 'package:careno/views/screens/screen_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              height: 570.h,
              width: MediaQuery.of(context).size.width,
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
              top: 500.h,
              bottom: 0,
              child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Image.asset("assets/images/careno.png",).marginOnly(top: 40.sp, bottom: 15.sp),
                CustomButton(title: 'Login', onPressed: () {
                  Get.to(ScreenLogin());
                },).marginSymmetric(vertical: 25.h),
                    Button("Register", () {
                      Get.to(ScreenSignup());
                    })

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
