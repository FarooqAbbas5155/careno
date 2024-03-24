import 'package:careno/constant/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../screens/screen_preview_category.dart';
import 'item_layout_explore_image.dart';
import 'item_layout_explore_popular.dart';
import 'layout_vehicle_google_map.dart';

class LayoutUserExplore extends StatefulWidget {
  @override
  State<LayoutUserExplore> createState() => _LayoutUserExploreState();
}

class _LayoutUserExploreState extends State<LayoutUserExplore> {
  Rx<int> newValue = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 156.h,
              width: Get.width,
              color: primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CARENO HOME",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "UrbanistBold",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.notifications_none_outlined,
                                    color: primaryColor,
                                    size: 30.sp,
                                  ),
                                ),
                                Positioned(
                                  top: 8.h,
                                  right: 0,
                                  left: 10.w,
                                  child: Container(
                                    height: 8.h,
                                    width: 8.w,
                                    padding: EdgeInsets.all(1.sp),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      // Set the color to red
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ).marginSymmetric(horizontal: 10.w),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.r)),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (newValue.value == 0) {
                                    newValue.value = 1;
                                  } else {
                                    newValue.value = 0;
                                  }
                                });
                              },
                              child: SvgPicture.asset(
                                "assets/images/export.svg",
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ).marginSymmetric(vertical: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45.h,
                        width: 294.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r)),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search for City, airport, or a hotel...",
                            hintStyle: TextStyle(
                                color: Color(0xffABABAB),
                                fontSize: 14.sp,
                                fontFamily: "Urbanist"),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xffABABAB),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 4),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        height: 42.h,
                        width: 42.w,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r)),
                        child: SvgPicture.asset(
                          "assets/images/Group.svg",
                        ),
                      ),
                    ],
                  ).marginSymmetric(vertical: 16.h)
                ],
              ),
            ),
            newValue == 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 177.h,
                        width: 345.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            image: DecorationImage(
                                image: AssetImage("assets/images/car.png"),
                                fit: BoxFit.fill)),
                      ).marginSymmetric(vertical: 14.h),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.h),
                        child: Text(
                          "Explore Categories",
                          style: TextStyle(
                              fontFamily: "UrbanistBold",
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                          color: Colors.white,
                          height: 140.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // Adjust the number of items per row
                              crossAxisSpacing: 2.0,
                              // Adjust spacing between items horizontally
                              mainAxisSpacing:
                                  2.0, // Adjust spacing between items vertically
                            ),
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                  onTap: () {
                                    Get.to(ScreenPreviewCategory());
                                  },
                                  child: ItemLayoutExploreImage());
                            },
                          )).marginOnly(bottom: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Vehicles",
                            style: TextStyle(
                                fontFamily: "UrbanistBold",
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Text(
                                "See all ",
                                style: TextStyle(
                                    fontFamily: "Urbanist",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor),
                              ).marginSymmetric(horizontal: 2.w),
                              SvgPicture.asset("assets/images/see_all.svg")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 114.h,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 30,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemLayoutExplorePopular();
                          },
                        ),
                      )
                    ],
                  ).marginSymmetric(horizontal: 14.w)
                : LayoutVehicleGoogleMap(),
          ],
        ),
      ),
    );
  }
}
