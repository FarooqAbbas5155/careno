import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/colors.dart';
import 'layout_active_booking.dart';
import 'layout_completed_booking.dart';
import 'layout_pending_booking.dart';

class LayoutUserBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Bookings",
              style: TextStyle(
                  color: AppColors.appPrimaryColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.h),
            child: Container(
              height: 45.h,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(
                      color: AppColors.appPrimaryColor
                  )
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 5.h),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: AppColors.appPrimaryColor
                ),
                unselectedLabelStyle: TextStyle(
                    color: AppColors.blackLightColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Nunito"
                ),
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Nunito"
                ),
                tabs: [
                  Tab(
                    text: "Pending",
                  ),
                  Tab(
                    text: "Active",
                  ),
                  Tab(
                    text: "Completed",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          LayoutPendingBooking(),
          LayoutActiveBooking  (),
          LayoutCompletedBooking(),
        ],),
      ),
    );
  }
}
