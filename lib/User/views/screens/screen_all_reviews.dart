import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../layouts/item_screen_car_details.dart';

class ScreenAllReviews extends StatelessWidget {
  const ScreenAllReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "See All Reviews",
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "UrbanistBold"),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Over All Rating",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontFamily: "UrbanistBold"),
          ).marginOnly(bottom: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: 200.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:22.w),
                      child: Text(
                        "5.0",
                        style: TextStyle(
                            fontSize: 42.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: "UrbanistBold"),
                      ),
                    ).marginSymmetric(vertical: 8.h),
                    RatingBar(
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      onRatingChanged: (value) => debugPrint('$value'),
                      initialRating: 5,
                      maxRating: 5,
                      size: 24,
                    ).marginSymmetric(vertical: 8.h),
                    Text("922 Reviews",style: TextStyle(color: Color(0xff616161).withOpacity(.8),fontFamily: "Urbanist",fontSize: 15.sp),).marginOnly(top: 12.h,left: 12.w),

                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("5 star",style: TextStyle(fontSize: 14.sp,fontFamily: "UrbanistBold",color: Colors.black),),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: 0.9,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Color(0xffeeeeee),
                        progressColor: Colors.amber,
                      ),

                    ],
                  ).marginSymmetric(vertical: 6.h),
                  Row(
                    children: [
                      Text("4 star",style: TextStyle(fontSize: 14.sp,fontFamily: "UrbanistBold",color: Colors.black),),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: 0.5,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Color(0xffeeeeee),
                        progressColor: Colors.amber,
                      ),

                    ],
                  ).marginSymmetric(vertical: 6.h),
                  Row(
                    children: [
                      Text("3 star",style: TextStyle(fontSize: 14.sp,fontFamily: "UrbanistBold",color: Colors.black),),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: 0.4,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Color(0xffeeeeee),
                        progressColor: Colors.amber,
                      ),

                    ],
                  ).marginSymmetric(vertical: 6.h),
                  Row(
                    children: [
                      Text("2 star",style: TextStyle(fontSize: 14.sp,fontFamily: "UrbanistBold",color: Colors.black),),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: 0.3,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Color(0xffeeeeee),
                        progressColor: Colors.amber,
                      ),

                    ],
                  ).marginSymmetric(vertical: 6.h),
                  Row(
                    children: [
                      Text("1 star",style: TextStyle(fontSize: 14.sp,fontFamily: "UrbanistBold",color: Colors.black),),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 14.0,
                        percent: 0.2,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Color(0xffeeeeee),
                        progressColor: Colors.amber,
                      ),

                    ],
                  ).marginSymmetric(vertical: 6.h),
                ],
              )
            ],
          ),
          Text(
            "Reviews",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                fontFamily: "UrbanistBold"),
          ).marginOnly(bottom: 3.h,top: 20.h),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return ItemScreenCarDetails();
              },),
          )

        ],
      ).marginSymmetric(horizontal: 15.sp, vertical: 10.h),
    ));
  }
}
