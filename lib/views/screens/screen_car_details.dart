import 'package:careno/constant/custom_button.dart';
import 'package:careno/constant/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ScreenCarDetails extends StatelessWidget {
  const ScreenCarDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 313.h,
                    width: 375.w,
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
                  Positioned(
                    right: 10.w,
                    bottom: 20.h,
                    child: RichText(
                      text: TextSpan(
                        text: '\$ 50',
                        style: TextStyle(color: Colors.white,fontFamily: "UrbanistBold",fontWeight: FontWeight.w800,fontSize: 18.sp),
                        children: <TextSpan>[
                          TextSpan(
                            text: '/per day',
                            style: TextStyle(color: Colors.white,fontFamily: "Urbanist",fontWeight: FontWeight.w500,fontSize: 16.sp),

                          ),
                        ],
                      ),
                    ).marginOnly(bottom: 5.h),
                  ),
                ],
              ),
              Container(
                width: Get.width,
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
                    Text("Toyota Camry",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700,fontFamily: "UrbanistBold"),).marginOnly(bottom: 4.h,top: 4.h),
                    Row(
                      children: [
                        Text("Location: ",style: TextStyle(color: Color(0xff616161),fontFamily: "Urbanist",fontWeight: FontWeight.w600,fontSize: 13.sp),),
                        Text("Street 2, City, New York, United State",style: TextStyle(color: primaryColor,fontFamily: "Urbanist",fontSize: 13.sp,decoration: TextDecoration.underline),)
                      ],
                    ).marginOnly(bottom: 8.h),
                    TextWidget("Year", "2022", "Type", "Sedon"),
                    TextWidget("Color", "Black", "Seats", "05"),
                    TextWidget("Transmisssion", "Automatic", "Fuel Type", "Gasoline"),
                    Text("Description",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700,fontFamily: "UrbanistBold"),).marginOnly(bottom: 4.h,top: 4.h),
                    Text("The Toyota Camry is a stylish and reliable sedan that offers a comfortable and enjoyable driving experience. With its sleek design and advanced features, the Camry is perfect for both city commuting and long road trips.",style: TextStyle(color: Color(0xff616161).withOpacity(.8),fontFamily: "Urbanist",fontSize: 13.sp),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: 150.w,
                            title: "Book Now", onPressed: (){}),
                        CustomButton(
                          width: 150.w,
                            title: "Message", onPressed: (){}),
                      ],
                    ).marginSymmetric(vertical: 4.h),
                  ],
                ).marginSymmetric(horizontal: 10.w),
              ).marginOnly(left: 10.w,right: 10.w,top: 8.h,bottom: 12.h),
              Container(
                width: Get.width,
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "13 Reviews",
                          style: TextStyle(
                              fontFamily: "UrbanistBold",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "See all ",
                          style: TextStyle(
                              fontFamily: "Urbanist",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        ).marginSymmetric(horizontal: 2.w),

                      ],
                    ),

                  ],
                ).marginSymmetric(horizontal: 10.w),
              ).marginSymmetric(horizontal: 10.w),
            ],
          ),
        ));
  }
}
Widget TextWidget(String title,description,String title2,String description2){
  return       Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${title}: ",style: TextStyle(color: Color(0xff616161),fontFamily: "Urbanist",fontWeight: FontWeight.w600,fontSize: 13.sp),),
          Text("${description}",style: TextStyle(color: Color(0xff616161).withOpacity(.8),fontFamily: "Urbanist",fontSize: 13.sp),)
        ],
      ),
      SizedBox(
        width: 140.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${title2}: ",style: TextStyle(color: Color(0xff616161),fontFamily: "Urbanist",fontWeight: FontWeight.w600,fontSize: 13.sp),),
            Text("${description2}",style: TextStyle(color: Color(0xff616161).withOpacity(.8),fontFamily: "Urbanist",fontSize: 13.sp),)
          ],
        ),
      )
    ],
  ).marginOnly(bottom: 6.h);
}
