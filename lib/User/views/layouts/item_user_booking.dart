import 'package:careno/User/views/screens/screen_booking_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';

class ItemUserBooking extends StatelessWidget {
String status;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Get.to(ScreenBookingDetails(status: status,));
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.12),
                  offset: Offset(2, 2),
                  blurStyle: BlurStyle.outer,
                  blurRadius: 15.r,
                  spreadRadius: 2.r),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 72.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: Get.height,
                    width: 73.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        image: DecorationImage(
                            image: AssetImage("assets/images/user-image.png"),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kristin Watson",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 14.sp),
                              ),
                              Text(
                                "322 Hoffman Dr, Cherry Hill, NJ 08077, New York",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,

                                    fontFamily: "Nunito",
                                    color: AppColors.appPrimaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp),
                              ),
                            ],
                          ).marginOnly(left: 8.w, right: 15.w),
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
                                      : status == "In progress"
                                      ? Color(0xFF00A651)
                                      : status == "Completed"
                                      ? Color(0xFF0F9D58)
                                      : Color(0xFFFF2021),
                                  fontSize: 12.sp),
                            ),
                            Text(
                              "\$ 350",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.appPrimaryColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Booking Date',
                        style: TextStyle(
                            color: Color(0xFF848484),
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            fontFamily: "Nunito"),
                      ).marginOnly(bottom: 3.h),
                      Text(
                        "March 15 - 18, 2024",
                        style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp,color: Colors.black),
                      )
                    ],
                  ),
                  VerticalDivider(color: Colors.black.withOpacity(.1),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Pick-up & Drop-off Time',
                        style: TextStyle(
                            color: Color(0xFF848484),
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            fontFamily: "Nunito"),
                      ).marginOnly(bottom: 3.h),
                      Text(
                        "10:00 AM - 11:00 AM",
                        style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 11.sp,color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ).marginOnly(top: 15.h),
          ],
        ),
      ),
    );;
  }

ItemUserBooking({
    required this.status,
  });
}
