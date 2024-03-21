import 'package:careno/constant/button.dart';
import 'package:careno/constant/custom_button.dart';
import 'package:careno/constant/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAllowLocation extends StatelessWidget {
  const ScreenAllowLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
        child: Column(
          children: [
            Image.asset("current_location.png"),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: "Allow",
                  style: TextStyle(fontFamily: "UrbanistBold ",fontSize: 22.sp,fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: "${"Careno App"}",
                  style: TextStyle(fontFamily: "UrbanistBold",fontSize: 22.sp,fontWeight: FontWeight.w600,color: primaryColor),
                ),
                TextSpan(
                  text: "to use",
                  style: TextStyle(fontFamily: "UrbanistBold ",fontSize: 22.sp,fontWeight: FontWeight.w600),
                ),

              ]
            )),
            CustomButton(title: "Allow", onPressed: (){},color: primaryColor,),
            Button("Allow While Using App", () { }),
            Button("Don't Allow", () { })
          ],
        ),
      ),
    ));
  }
}
