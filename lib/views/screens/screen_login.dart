import 'package:careno/constant/custom_button.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/views/screens/screen_forget_password.dart';
import 'package:careno/views/screens/screen_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constant/custom_textfiled.dart';
import '../../controllers/home_controller.dart';

class ScreenLogin extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController()); // Initialize HomeController


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/careno.png").marginSymmetric(
                  vertical: 60.h),
              Center(child: Text("Sign in to your Account ", style: TextStyle(
                  fontFamily: "UrbanistBold",
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: Colors.black),)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email", style: TextStyle(fontFamily: "UrbanistBold",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),).marginOnly(top: 30.h, bottom: 8.h),
                    CustomTextField(
                      hint: "Enter Email",
                    ),
                    Text("Password", style: TextStyle(fontFamily: "UrbanistBold",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),).marginOnly(
                        top: 30.h, bottom: 8.h),
                    Obx(() =>
                        CustomTextField(
                          padding: EdgeInsets.only(top: 20.h, left: 10.w),
                          // Observe the changes in isPasswordVisible
                          hint: "********",
                          suffix: IconButton(
                            onPressed: () {
                              _homeController.isPasswordVisible
                                  .toggle(); // Toggle password visibility
                            },
                            icon: Padding(
                              padding: EdgeInsets.only(top: 10.h,),
                              // Observe the changes in isPasswordVisible
                              child: Icon(
                                _homeController.isPasswordVisible.value ? Icons
                                    .visibility : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          // isPasswordField: _homeController.isPasswordVisible.value,
                          obsercureText: _homeController.isPasswordVisible.value,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(() {
                              return Checkbox(
                                value: _homeController.checkBox.value,
                                fillColor: MaterialStateProperty.all( _homeController.checkBox.isTrue?primaryColor:Colors.white),
                                // Set initial value as per your requirement
                                onChanged: (bool? value) {
                                  _homeController.checkBox.toggle();
                                },
                              );
                            }
                            ),
                            Text('Remember me', style: TextStyle(
                                fontFamily: "Urbanist",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),),
          
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(ScreenForgetPassword());
                          },
                          child: Text('Forget Password?', style: TextStyle(
                              fontFamily: "Urbanist",
                              fontSize: 15.sp,
                              color: primaryColor,
                              fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ).marginSymmetric(vertical: 4.h),
                    Center(child: CustomButton(title: "Login", onPressed: (){})).marginSymmetric(vertical: 30.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            indent: (10.w).toDouble(),
                            // endIndent: (2.w).toDouble(),
                            color: Color(0xffEDEEEE),
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("or Continue with",style: TextStyle(color: Colors.black,fontFamily: "Urbanist",fontSize: 14.sp),),
                        ),
                        Expanded(
                          child: Divider(
                            // indent: (5.w).toDouble(),
                            // endIndent: (2.w).toDouble(),
                            color: Color(0xffEDEEEE),
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer("Facebook", "assets/images/logos_facebook.png", (){}),
                        CustomContainer("Facebook", "assets/images/logo_google.png", (){})
                      ],
                    ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black,fontFamily: "Urbanist",fontSize: 15.sp),
                        ),
                        TextSpan(
                          text: "Signup",
                          style: TextStyle(color: primaryColor,fontFamily: "UrbanistBold",fontSize: 16.sp), // Use primary color
                       recognizer: TapGestureRecognizer()..onTap = (){
                         Navigator.of(context).push(MaterialPageRoute(
                           builder: (context) => ScreenSignup(),
                         ));
                        }
                        ),
                      ],
                    ),
                  ),
                ),
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
Widget CustomContainer(String title,String imagePath,VoidCallback onpress){
  return InkWell(
    onTap: onpress,
    child: Container(
      width: 145.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(width: 1,                          color: Color(0xffEDEEEE),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,width: 25.w,),
          SizedBox(width: 8), // Add some space between icon and text
          Text(
            'Facebook',
            style: TextStyle(fontSize: 14.sp,fontFamily: "Urbanist",fontWeight: FontWeight.w600),
          ),
        ],
      ),  ),
  ).marginSymmetric(vertical: 35.h);
}