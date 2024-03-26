import 'package:careno/Host/Views/Screens/screen_host_vehicle_my_detail.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../../../constant/helpers.dart';

class ItemHostVehicle extends StatelessWidget {
 String status;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ScreenHostVehicleMyDetail(status:status));
      },
      child: Container(
        alignment: Alignment.center,
        height: 75.h,
        width: 345.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical:6.h),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 3, // Blur radius
              offset: Offset(0, 3), // Offset of the shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 57.h,
              width: 56.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                      image: AssetImage("assets/images/car2.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tesla Model 3",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontFamily:"UrbanistBold" ,fontWeight: FontWeight.w700),),
                  Text("Electric Car",style: TextStyle(color: Colors.black.withOpacity(.5),fontSize: 10.sp,fontFamily:"Urbanist" ,fontWeight: FontWeight.w500),).marginOnly(bottom: 2.h),
                  Row(
                    children: [
                      CustomSvg(name:"Star"),
                      Text("5.0",style: TextStyle(color: Colors.black,fontSize: 13.sp,fontFamily:"UrbanistBold" ,fontWeight: FontWeight.w600),),
                      Text("(528)",style: TextStyle(color: Color(0xffAAAAAA),fontSize: 11.sp,fontFamily:"Urbanist" ,fontWeight: FontWeight.w600),).marginOnly(left: 4.w),
                    ],
                  ),

                ],
              ).marginSymmetric(horizontal: 8.w),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  status,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: status == "Pending"
                          ? Color(0xFFFB9701)

                          : Color(0xFF00A651),

                      fontSize: 12.sp),
                ),
                RichText(
                  text: TextSpan(
                    text: '\$ 50',
                    style: TextStyle(color: primaryColor,fontFamily: "UrbanistBold",fontWeight: FontWeight.w800,fontSize: 16.sp),
                    children: <TextSpan>[
                      TextSpan(
                        text: '/per day',
                        style: TextStyle(color: primaryColor,fontFamily: "Urbanist",fontWeight: FontWeight.w500,fontSize: 14.sp),

                      ),
                    ],
                  ),
                ).marginOnly(bottom: 5.h)

              ],
            )

          ],
        ),
      ),
    );
  }

 ItemHostVehicle({
    required this.status,
  });
}
