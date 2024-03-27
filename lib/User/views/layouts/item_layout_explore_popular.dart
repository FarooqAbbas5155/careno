import 'package:careno/User/views/screens/screen_car_details.dart';
import 'package:careno/constant/colors.dart';
import 'package:careno/constant/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemLayoutExplorePopular extends StatelessWidget {
  const ItemLayoutExplorePopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ScreenCarDetails());
      },
      child: Container(
        // height: 81.h,
        width: 345.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical:6.h),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 3, // Blur radius
              offset: Offset(0, 3), // Offset of the shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
             Row(
               children: [
                 Container(
                   height: 72.h,
                   width: 56.w,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5.r),
                       image: DecorationImage(
                           image: AssetImage("assets/images/car2.png"),
                           fit: BoxFit.fill
                       )
                   ),
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Tesla Model 3",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontFamily:"Urbanist" ,fontWeight: FontWeight.w700),),
                     Text("Electric Car",style: TextStyle(color: Color(0xffAAAAAA),fontSize: 10.sp,fontFamily:"Urbanist" ,fontWeight: FontWeight.w500),).marginOnly(bottom: 2.h),
                     Row(
                       children: [
                         Icon(Icons.star,color: AppColors.starColor,),
                         Text("5.0",style: TextStyle(color: Colors.black,fontSize: 11.sp,fontFamily:"UrbanistBold" ,fontWeight: FontWeight.w600),),
                         Text("(528)",style: TextStyle(color: Color(0xffAAAAAA),fontSize: 11.sp,fontFamily:"Urbanist" ,fontWeight: FontWeight.w600),).marginOnly(left: 4.w),
                       ],
                     ),

                   ],
                 ).marginOnly(left: 8.w),
               ],
             ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 36.h,
                  width: 40.w,
                  margin: EdgeInsets.only(left: 12.w),
                  decoration: BoxDecoration(
                    color: Color(0xffAAAAAA).withOpacity(.2),
                    shape: BoxShape.circle
                  ),
                  child: Icon(Icons.favorite_border,color: Color(0xff949494),),
                ).marginOnly(left: 18.w),
                RichText(
                  text: TextSpan(
                    text: '\$ 50',
                    style: TextStyle(color: primaryColor,fontFamily: "Urbanist",fontWeight: FontWeight.w700,fontSize: 14.sp),
                    children: <TextSpan>[
                      TextSpan(
                        text: '/per day',
                        style: TextStyle(color: primaryColor,fontFamily: "Urbanist",fontWeight: FontWeight.w500,fontSize: 12.sp),

                      ),
                    ],
                  ),
                ).marginOnly(bottom: 2.h)

              ],
            )

          ],
        ),
      ),
    );
  }
}
