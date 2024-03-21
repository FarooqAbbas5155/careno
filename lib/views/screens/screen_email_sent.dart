import 'package:careno/constant/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenEmailSent extends StatelessWidget {
  const ScreenEmailSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/sticker_sent.png",width: 130.w,).marginSymmetric(vertical: 25.h),
              Text(
                "I have sent you a password reset link Please check your email inbox and confirm.",
                style: TextStyle(
                    color: Color(0xff000000).withOpacity(.5),
                    fontSize: 19.sp,
                    fontFamily: "Urbanist"),
              ),
              CustomButton(title: "Done", onPressed: (){

              }).marginSymmetric(vertical: 40.h)
            ],
          ),
        ),
      ),
    ));
  }
}
