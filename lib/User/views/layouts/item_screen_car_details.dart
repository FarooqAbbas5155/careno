import 'package:careno/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemScreenCarDetails extends StatelessWidget {
  const ItemScreenCarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25.r,
              child: Image.asset("assets/images/home Grur.png")),
          title: Text("Alex Jack",style: TextStyle(fontSize: 18.sp,fontFamily: "Urbanist",fontWeight: FontWeight.w600 ),),
          subtitle: Text("21 June 2021",style: TextStyle(color: AppColors.greyColor,fontSize: 12.sp), ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star,color: AppColors.starColor,),
              Text("5.0",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontFamily:"UrbanistBold" ,fontWeight: FontWeight.w700),),

            ],

          )
        ),
        Text("Review text popular belief, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has...",style: TextStyle(color: Color(0xff414141),fontWeight: FontWeight.w500,fontSize: 14.sp),).marginSymmetric(horizontal: 20.w),
        Divider(
          indent: 8.w,
          endIndent: 20.w,
          color: AppColors.dividerColor.withOpacity(.3),
        )
      ],
    );
  }
}
