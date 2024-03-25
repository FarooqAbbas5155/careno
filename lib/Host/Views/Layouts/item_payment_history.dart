import 'package:careno/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemPaymentHistory extends StatelessWidget {
  const ItemPaymentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text("Order ID: 45756768",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp),),
            SizedBox(height: 5.h,),
            Text("2023-01-10 . 08:45 PM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.sp,color: Color(0xFF969696)),),

          ],)),
            Text("\$40",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700,color: AppColors.appPrimaryColor),)
           ],
        ).marginOnly(bottom: 6.h),
        Divider(color: Color(0xFFBBBBBB).withOpacity(.5),thickness: .5
          ,)
      ],
    ).marginSymmetric(horizontal: 13.w,vertical: 4.h);
  }
}
