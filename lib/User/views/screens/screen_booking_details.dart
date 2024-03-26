import 'package:careno/User/views/screens/screen_all_reviews.dart';
import 'package:careno/User/views/screens/screen_booking.dart';
import 'package:careno/User/views/screens/screen_booking_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../../../constant/helpers.dart';
import '../../../widgets/custom_button.dart';
import '../layouts/item_screen_car_details.dart';

class ScreenBookingDetails extends StatelessWidget {
String status;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 313.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/image_car_details.png"),
                              fit: BoxFit.cover

                          )
                      ),
                    ),
                    Positioned(
                      left: 10.w,
                      top: 20.h,
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          height: 29.h,
                          width: 29.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                          child: Icon(Icons.navigate_before_outlined,color: Colors.black,),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      left: 10.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 35.w),
                            padding: EdgeInsets.all(2.r),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2,color: Colors.white)
                            ),
                            child: CircleAvatar(
                              radius: 35.r,
                              backgroundImage: AssetImage("assets/images/home Grur.png"),
                            ),
                          ),
                          Text("Arvind Bhat",style: TextStyle(color: Colors.white,fontFamily: "Urbanist",fontWeight: FontWeight.w600,fontSize: 24.sp),),
                          Row(
                            children: [
                              Icon(Icons.star,color: Color(0xffFBC017),),
                              Text("5.0",style: TextStyle(color: Colors.white,fontSize: 16.sp,fontFamily:"UrbanistBold" ,fontWeight: FontWeight.w700),),
                              Text("(528)",style: TextStyle(color: Colors.white.withOpacity(.8),fontSize: 11.sp,fontFamily:"Urbanist" ,fontWeight: FontWeight.w600),).marginOnly(left: 4.w),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(bottom: 12.h),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Toyota Camry",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,fontFamily: "UrbanistBold"),).marginOnly(bottom: 4.h,top: 4.h),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 8.h,
                                width: 8.h,
                                decoration: BoxDecoration(
                                  color: AppColors.starColor,
                                  shape: BoxShape.circle
                                ),
                              ),
                              Text("Pending",style: TextStyle(color:AppColors.starColor,fontSize: 14.sp,fontWeight: FontWeight.w500,fontFamily: "UrbanistItalic"),).marginOnly(bottom: 4.h,top: 4.h),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Location: ",style: TextStyle(color: Color(0xff616161),fontFamily: "UrbanistBold",fontWeight: FontWeight.w600,fontSize: 15.sp),),
                          Text("Street 2, City, New York, United State",style: TextStyle(color: primaryColor,fontFamily: "Urbanist",fontSize: 15.sp,decoration: TextDecoration.underline),)
                        ],
                      ).marginOnly(bottom: 8.h),
                      TextWidget("Year", "2022", "Type", "Sedon"),
                      TextWidget("Color", "Black", "Seats", "05"),
                      TextWidget("Transmisssion", "Automatic", "Fuel Type", "Gasoline"),
                      Text("Description",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700,fontFamily: "UrbanistBold"),).marginOnly(bottom: 4.h,top: 4.h),
                      Text("The Toyota Camry is a stylish and reliable sedan that offers a comfortable and enjoyable driving experience. With its sleek design and advanced features, the Camry is perfect for both city commuting and long road trips.",style: TextStyle(color: Color(0xff616161).withOpacity(.8),fontFamily: "Urbanist",fontSize: 13.sp),),
                    ],
                  ).marginSymmetric(horizontal: 10.w),
                ).marginOnly(left: 10.w,right: 10.w,top: 8.h,bottom: 12.h),

                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(bottom: 12.h),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Booking Summary",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "UrbanistBold",
                        ),
                      ),
                    ),
                    BookingSummary("Start Date", "14 March 2024"),
                    BookingSummary("End Date", "20 March 2024"),
                    BookingSummary("Pick-up Time", "10:00 AM"),
                    BookingSummary("Drop-off Time", "20:00 AM"),
                    Divider(
                      indent: 1,
                      endIndent: 1,
                      color: Color(0xffEDEEEE),

                      // color: AppColors.dividerColor,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Price Summary",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "UrbanistBold",
                        ),
                      ),
                    ),
                    BookingSummary("Subtotal", "\$350"),
                    BookingSummary("Service Fee", "\$15"),
                      Divider(
                        indent: 1,
                        endIndent: 1,
                        color: Color(0xffEDEEEE),

                        // color: AppColors.dividerColor,
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: TextStyle(color: Color(0xff484848),fontSize: 15.sp,fontWeight: FontWeight.w600,),),
                        Text("\$365",style: TextStyle(color:AppColors.appPrimaryColor,fontSize: 16.sp,fontWeight: FontWeight.w600,fontFamily: "UrbanistBold"),),
                      ],
                    ).marginSymmetric(horizontal:12.w,vertical: 4.h),
                      Center(child: CustomButton(title: "Message", onPressed: (){})).marginOnly(top: 14.h)
                  ],),
                ).marginOnly(left: 10.w,right: 10.w,top: 8.h,bottom: 12.h),

              ],
            ),
          ),
        ));
  }
  Widget TextWidget(String title,description,String title2,String description2){
    return       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${title}: ",style: TextStyle(color: Color(0xff616161),fontFamily: "UrbanistBold",fontWeight: FontWeight.w600,fontSize: 15.sp),),
            Text("${description}",style: TextStyle(color: Color(0xff616161).withOpacity(.8),fontFamily: "Urbanist",fontSize: 13.sp),)
          ],
        ),
        SizedBox(
          width: 140.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${title2}: ",style: TextStyle(color: Color(0xff616161),fontFamily: "UrbanistBold",fontWeight: FontWeight.w600,fontSize: 15.sp),),
              Text("${description2}",style: TextStyle(color: Color(0xff616161).withOpacity(.8),fontFamily: "Urbanist",fontSize: 15.sp),)
            ],
          ),
        )
      ],
    ).marginOnly(bottom: 6.h);
  }

ScreenBookingDetails({
    required this.status,
  });
}
//                      Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           CustomButton(
//                               width: 150.w,
//                               title: "Book Now", onPressed: (){
//                             Get.to(ScreenBooking());
//                           }),
//                           CustomButton(
//                               width: 150.w,
//                               title: "Message", onPressed: (){}).marginSymmetric(vertical: 5.h),
//                         ],
//                       ).marginSymmetric(vertical: 4.h),