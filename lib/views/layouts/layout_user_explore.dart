import 'package:careno/constant/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LayoutUserExplore extends StatelessWidget {
  const LayoutUserExplore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             height: 156.h,
             width: Get.width,
             color: primaryColor,
             padding: EdgeInsets.symmetric(horizontal: 15
                 .w,),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("CARENO HOME",style: TextStyle(color: Colors.white,fontFamily: "UrbanistBold",fontSize: 20.sp,fontWeight: FontWeight.w800),),
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
                                color: primaryColor,size: 30.sp,
                              ),
                            ),
                            Positioned(
                              top: 8.h,
                              right: 0 ,
                              left: 10.w,

                              child: Container(
                                height: 8.h,
                                width: 8.w,
                                padding: EdgeInsets.all(1.sp),
                                decoration: BoxDecoration(
                                  color: Colors.red, // Set the color to red
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
                             borderRadius: BorderRadius.circular(6.r)
                           ),
                           child: SvgPicture.asset("assets/images/export.svg",),
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
                         borderRadius: BorderRadius.circular(6.r)
                       ),
                       child: TextField(
                         decoration: InputDecoration(
                           hintText: "Search for City, airport, or a hotel...",
                           hintStyle: TextStyle(color: Color(0xffABABAB),fontSize: 14.sp,fontFamily: "Urbanist"),
                           prefixIcon: Icon(Icons.search,color: Color(0xffABABAB),),
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
                           borderRadius: BorderRadius.circular(6.r)
                       ),
                       child: SvgPicture.asset("assets/images/Group.svg",),
                     ),
                   ],
                 ).marginSymmetric(vertical: 16.h)
               ],
             ),
            ),
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 alignment: Alignment.center,
                 height: 177.h,
                 width: 345.w,
                 decoration: BoxDecoration(
                   color: Colors.red,
                   borderRadius: BorderRadius.circular(5.r),
                   image: DecorationImage(
                       image: AssetImage("assets/images/car.png"),
                     fit: BoxFit.fill

                   )
                 ),
               ).marginOnly(left: 5.h,right: 5.h,top: 16.h,bottom: 12.h),
               Padding(
                 padding:  EdgeInsets.only(bottom: 12.h),
                 child: Text("Explore Categories?",style: TextStyle(fontFamily: "UrbanistBold",fontSize: 24.sp,fontWeight: FontWeight.w700),),
               ),

             ],
           ).marginSymmetric(horizontal: 14.w),
         ],
       ),
      ),
    );
  }
}
