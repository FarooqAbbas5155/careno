import 'package:careno/TermsConditionSection/screen_privacy_policy.dart';
import 'package:careno/TermsConditionSection/screen_terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_svg.dart';

class ScreenHostSetting extends StatelessWidget {
  RxBool isNotification = true.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            onTap: () {},
            leading: Container(
              height: 36.h,
              width: 36.w,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: CustomSvg(
                name: "notification-setting",
              ),

            ),
            title: Text("Notifications", style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 15.sp
            ),),
            trailing: Obx(() {
              return Switch(
                value: isNotification.value, onChanged: (bool value) {
                isNotification.value = value;
              },);
            }),
          ),
          ListTile(
            onTap: (){
              Get.to(ScreenTermsAndConditions());
            },
            leading: Container(
              height: 36.h,
              width: 36.w,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: CustomSvg(
                name: "terms",
              ),

            ),
            title: Text("Terms & Conditions",style: TextStyle(
                fontWeight: FontWeight.w700,fontSize: 15.sp
            ),),
            trailing: CustomSvg(name: "arrow-forward",),
          ),
          ListTile(
            onTap: (){
              Get.to(ScreenPrivacyPolicy());
            },
            leading: Container(
              height: 36.h,
              width: 36.w,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: CustomSvg(
                name: "policy",
              ),

            ),
            title: Text("Privacy Policy",style: TextStyle(
                fontWeight: FontWeight.w700,fontSize: 15.sp
            ),),
            trailing: CustomSvg(name: "arrow-forward",),
          ),
          ListTile(
            onTap: (){
            },
            leading: Container(
              height: 36.h,
              width: 36.w,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: CustomSvg(
                name: "delet",
              ),

            ),
            title: Text("Delete Account",style: TextStyle(
                fontWeight: FontWeight.w700,fontSize: 15.sp
            ),),
            trailing: CustomSvg(name: "arrow-forward",),
          ),


        ],
      ),
    ));
  }
}
