import 'package:careno/User/views/screens/screen_search_filter.dart';
import 'package:careno/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../layouts/item_layout_explore_popular.dart';

class ScreenFilter extends StatelessWidget {
  void showCommentBottomSheet(BuildContext context) {
    // showModalBottomSheet displays a modal bottom sheet that typically contains controls related to the current context
    showModalBottomSheet(
      context: context,
      useSafeArea: false,
      // scrollControlDisabledMaxHeightRatio: 0.5,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
      ),
      builder: (BuildContext context) {
        // Return the CommentBottomSheet widget
        return Container(
          margin: EdgeInsets.only(top: 110.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),

          ),// Add your desired top margin here
          child: ScreenSearchFilter(),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(

        child:Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.appPrimaryColor,
            shape: CircleBorder(),
            child:SvgPicture.asset(
              "assets/images/Group.svg",color: Colors.white,
            ),
            onPressed: () {
              showCommentBottomSheet(context);

            },),
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
              "Filter Results",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "UrbanistBold"),
            ),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
              return ItemLayoutExplorePopular();
            },),
          ),
        ));
  }
}
