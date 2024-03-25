import 'package:careno/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../screens/screen_user_chat.dart';

class ItemUserList extends StatelessWidget {
  const ItemUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ScreenUserChat());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: <Widget>[
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/user-image.png"))
                ),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: CustomSvg(name: "circle",)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Kristin Watson",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp
                  ),),
                  Text("Hey, How it’s going?",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    color: Color(0xFF373132)
                  ),),
                ],).marginSymmetric(horizontal: 8.h),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("14:55",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                  color: Color(0xFFFF2021),
                  shape: BoxShape.circle,

                ),
                child: Text("3",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14.sp
                ),),
                )
              ],),

            ],
          ).marginSymmetric(horizontal: 25.w
          ,vertical: 5.h),
          SizedBox(
              width: 291.w,
              child: Divider(color: Color(0xFF787878).withOpacity(.35),))
        ],
      ).marginSymmetric(vertical: 5.h),
    );
  }
}
