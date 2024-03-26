import 'package:careno/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemNotification extends StatelessWidget {
  const ItemNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(1, 1), // changes position of shadow
          )
        ]
      ),
      child: ListTile(
        title: Text("Chat Notification",style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp
        ),),
        subtitle: Text("Notification text will appear here.",style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500
        ),),
        trailing: CustomSvg(name: "noti",),
      ),
    );
  }
}
