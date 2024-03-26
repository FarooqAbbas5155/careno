import 'package:careno/User/views/screens/screen_user_favorite_vehicles.dart';
import 'package:flutter/material.dart';
import 'package:careno/Host/Views/Screens/screen_host_blocked_user.dart';
import 'package:careno/Host/Views/Screens/screen_host_documents.dart';
import 'package:careno/Host/Views/Screens/screen_host_edit_profile.dart';
import 'package:careno/Host/Views/Screens/screen_host_setting.dart';
import 'package:careno/Host/Views/Screens/screen_host_vehicle.dart';
import 'package:careno/Host/Views/Screens/screen_host_vehicle_my_detail.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';class LayoutUserProfile extends StatelessWidget {
  const LayoutUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: AppColors.appPrimaryColor,
          child: Stack(
            children: [
              Positioned(
                  top: 150.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(350, 170))),
                  )),
              Positioned(
                top: 30.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "My Profile",
                      style: TextStyle(
                          fontSize: 23.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ).marginOnly(bottom: 20.h),
                    Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage:
                        AssetImage("assets/images/user-image.png"),
                      ),
                    ),
                    Text(
                      "Jenny Wilson",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "jenniferfowler78@gmail.com",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500,color: Colors.black.withOpacity(.5)),
                    ),
                    Container(
                      width: Get.width,
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Color(0xFFF0F0F0)
                      ),
                      child: Text("Preferences",style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700
                      ),),
                    ).marginOnly(top: 30.h,bottom: 10.h),
                    ListTile(
                      onTap: (){
                        Get.to(ScreenHostEditProfile(userType: 'user',));
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "edit-profile",
                        ),

                      ),
                      title: Text("Edit Account",style: TextStyle(
                          fontWeight: FontWeight.w700,fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),

                    ListTile(
                      onTap: (){
                        Get.to(ScreenHostSetting());
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "setting",
                        ),

                      ),
                      title: Text("Settings",style: TextStyle(
                          fontWeight: FontWeight.w700,fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),
                    ListTile(
                      onTap: (){
                        Get.to(ScreenUserFavoriteVehicles());
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "fav",
                        ),

                      ),
                      title: Text("Favorite Vehicles",style: TextStyle(
                          fontWeight: FontWeight.w700,fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),
                    ListTile(
                      onTap: (){
                        Get.to(ScreenHostBlockedUser());
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "block",
                        ),

                      ),
                      title: Text("Blocked Users",style: TextStyle(
                          fontWeight: FontWeight.w700,fontSize: 15.sp
                      ),),
                      trailing: CustomSvg(name: "arrow-forward",),
                    ),
                    ListTile(
                      onTap: (){
                      },
                      leading: Container(
                        height: 36.h,
                        width: 36.w,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(8.r)
                        ),
                        child: CustomSvg(
                          name: "logout",
                        ),

                      ),
                      title: Text("Logout",style: TextStyle(
                          fontWeight: FontWeight.w700,fontSize: 15.sp
                      ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
