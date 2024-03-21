import 'package:careno/constant/custom_button.dart';
import 'package:careno/constant/custom_textfiled.dart';
import 'package:careno/views/screens/screen_email_sent.dart';
import 'package:careno/views/screens/screen_signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constant/helpers.dart';

class ScreenForgetPassword extends StatelessWidget {
  const ScreenForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 35.h,
              width: 35.w,
              margin: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(width: 1, color: Color(0xffEDEEEE)),
              ),
              child: Icon(Icons.arrow_back_ios_new_sharp),
            )
          ),

        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 25.h,bottom: 6.h),
                child: Text("Forgot Password?",style: TextStyle(fontFamily: "UrbanistBold",fontSize: 24.sp,fontWeight: FontWeight.w700),),
              ),
              Text("Don't worry! It occurs. Please enter the email address linked with your account.",style:TextStyle(color: Color(0xff8391A1),fontFamily: "Urbanist" ,)),
              CustomTextField(
            hint: "Enter Email",
          ).marginOnly(top: 50.h,bottom: 50.h,left: 8.w),
              CustomButton(title: "Send Code", onPressed: (){}).marginOnly(left: 8.w),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(

                        text: "Remember Password? ",
                        style: TextStyle(color: Colors.black,fontFamily: "Urbanist",fontSize: 15.sp),
                      ),
                      TextSpan(
                          text: "Login",
                          style: TextStyle(color: primaryColor,fontFamily: "UrbanistBold",fontSize: 16.sp), // Use primary color
                          recognizer: TapGestureRecognizer()..onTap = (){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenEmailSent(),
                            ));
                          }
                      ),
                    ],
                  ),
                ),
              ).marginSymmetric(vertical: 60.h)
            ],
          ),
        ),
      ),
    );
  }
}
