import 'package:careno/AuthSection/screen_complete_profile.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:careno/constant/helpers.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pin_put/pin_put.dart';


class ScreenOtp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 35.h,
                  width: 35.w,
                  margin: EdgeInsets.only(left: 5.w,top: 5.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.sp),
                    border: Border.all(width: 1, color: Color(0xffEDEEEE)),
                  ),
                  child: Icon(Icons.arrow_back_ios_new_sharp),
                )
            ),

          ),
          body:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 25.w,top: 20.h),
                child: Text("OTP Verification",style: TextStyle(fontFamily: "UrbanistBold",fontSize: 24.sp,fontWeight: FontWeight.w700),),
              ),
              Text("Enter the verification code we just sent on your email address.",style:TextStyle(color: Color(0xff8391A1),fontFamily: "Urbanist" ,)).marginSymmetric(horizontal: 25.w),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 35.w,vertical: 20.h),
                child: PinPut(
                   autofocus: true,
                  onChanged: (value) {
                    // code = value;
                    // controller
                    //   ..isButtonEnabled.value = code.length == 6
                    //   ..update();
                  },
                  autofillHints: ["2","3","7"],
                  eachFieldWidth: 63.w,
                  cursorColor: primaryColor,
                  pinAnimationType: PinAnimationType.none,
                  eachFieldHeight: 60.h,
                  cursorHeight: 20.h,
                  fieldsCount: 4,
                    textStyle: TextStyle(color: primaryColor,fontFamily: "UrbanistBold",fontSize: 22.sp) ,
                  inputDecoration: InputDecoration(
                  //  filled: true,

                    hintStyle: TextStyle(color: primaryColor),
                    border: InputBorder.none,

                  ),
                  onSubmit: (String pin) {},
                  // focusNode: _pinPutFocusNode,
                  //
                  // controller: controller.pinPutController.value,
                  submittedFieldDecoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(8.0),

                  ),
                  followingFieldDecoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.1)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  selectedFieldDecoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(8.0),
                  ),

                ),
              ),
              Center(child: CustomButton(title: "Verify", onPressed: (){
                Get.to(ScreenCompleteProfile());
              })).marginSymmetric(vertical: 30.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(

                        text: "Don't received code? ",
                        style: TextStyle(color: Colors.black,fontFamily: "Urbanist",fontSize: 15.sp),
                      ),
                      TextSpan(
                          text: "Resend",
                          style: TextStyle(color: primaryColor,fontFamily: "UrbanistBold",fontSize: 16.sp), // Use primary color
                          // recognizer: TapGestureRecognizer()..onTap = (){
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => ScreenSignup(),
                          //   ));
                          // }
                      ),
                    ],
                  ),
                ),
              ).marginSymmetric(vertical: 30.h)
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 10.sp),
              //   child: GestureDetector(
              //     onTap: () {
              //       startTimer();
              //       controller.sendVerificationCode(LocaleKeys.Resend.tr);
              //     },
              //     child: RichText(
              //         text: TextSpan(children: [
              //           TextSpan(
              //               text: "LocaleKeys.IDidNotreceiveCode.tr",
              //               style: TextStyle(color: Colors.black,  fontSize: 11, fontWeight: FontWeight.w500)),
              //           TextSpan(text:" LocaleKeys.ResendCode.tr", style: TextStyle(color: Color(0xffFF92BC), fontSize: 14, fontWeight: FontWeight.w600)),
              //         ])),
              //   ),
              // ),
              //SizedBox(height:3.h ,),
              // TextButton(
              //   onPressed: () {},
              //   child: Text(
              //     "00:$start ${LocaleKeys.Sec.tr}",
              //     style: TextStyle(color: Color(0xff8B8C8F),  fontSize: 14, fontWeight: FontWeight.w400),
              //   ),
              // ),

            ],
          )),
    );
  }
}
