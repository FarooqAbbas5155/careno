import 'package:careno/constant/colors.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'item_user_list.dart';

class LayoutUserMessages extends StatelessWidget {
 RxBool filterValue=false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.appPrimaryColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                "Messages",
                style: TextStyle(fontSize: 24.sp,color: Colors.white, fontWeight: FontWeight.w900),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r)),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search here...",
                            hintStyle: TextStyle(
                                color: Color(0xff616161).withOpacity(.5),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Urbanist"),

                            prefixIcon: Padding(padding: EdgeInsets.all(10.sp),child: CustomSvg(name: "search",)),
                            contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Obx(() {
                      return GestureDetector(
                        onTap: (){
                          filterValue.value=!filterValue.value;
                        },
                        child: (filterValue.value)?Container(
                          height: 35.h,
                          width: 35.w,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,),
                          child: CustomSvg(name: "filter-chat",color: AppColors.appPrimaryColor),
                        ):CustomSvg(name: "filter-chat",),
                      ).marginOnly(left:15.r);
                    })
                  ],
                ).marginSymmetric(vertical: 15.h)

            ],),
          ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Obx(() => (filterValue.value==true)?Text("Filtered by Unread",style: TextStyle(
                fontSize: 18.sp,
                color: Color(0xFF484848),
                fontWeight: FontWeight.w700
              ),).marginSymmetric(vertical: 10.h,horizontal: 10.w):SizedBox()),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                return ItemUserList();
              },)
            ],),
          ))
        ],
      ),
    );
  }
}
