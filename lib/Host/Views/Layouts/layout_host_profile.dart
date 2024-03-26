import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';

class LayoutHostProfile extends StatelessWidget {
  const LayoutHostProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
          width: Get.width,
        color: AppColors.appPrimaryColor,
        child: Stack(children: [
          Positioned(
            top: 100.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(350, 170)
              )
            ),
          )),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),

        ],),
      ),
    );
  }
}
