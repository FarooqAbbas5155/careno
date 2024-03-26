import 'package:careno/User/views/screens/screen_add_card.dart';
import 'package:careno/constant/colors.dart';
import 'package:careno/controllers/booking_controller.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constant/helpers.dart';

class ScreenBookingReview extends StatelessWidget {
BookingController controller = Get.put(BookingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Bookings Review",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "UrbanistBold",
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: 640.h,
          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical:6.h),
          margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 18.w),
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
               Padding(
                 padding:  EdgeInsets.only(left: 12.0),
                 child: Text(
                  "Payment Method",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "UrbanistBold",
                  ),
                               ),
               ),

              Obx(() {
                return RadioListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/card.png",
                          width: 35.w,
                          height: 30.h,
                        ).marginOnly(right: 4.w),
                        Text("Credit or Debit Card",
                          style: TextStyle(color:  Color(0xff484848),fontFamily: "UrbanistBold",fontWeight: FontWeight.w700,fontSize: 18.sp),),
                      ],
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: primaryColor,

                    value: "CreditCard",
                    groupValue: controller.paymentType.value,
                    onChanged: (String? value) {
                      controller.paymentType.value = value!;
                    });

              }),
              Obx(() {
                return RadioListTile(

                    title: Row(
                      children: [
                        Image.asset(
                          "assets/images/me_paisa.png",
                          width: 35.w,
                          height: 30.h,
                        ).marginOnly(right: 4.w),
                        Text("M-Pesa Mobile ",
                          style: TextStyle(color: Color(0xff484848),fontFamily: "UrbanistBold",fontWeight: FontWeight.w700,fontSize: 18.sp),),
                      ],
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: primaryColor,

                    value: "Mepaisa",
                    groupValue: controller.paymentType.value,
                    onChanged: (String? value) {
                      controller.paymentType.value = value!;
                    });

              }),
              Divider(
                indent: 1,
                endIndent: 1,
                color: Color(0xffEDEEEE),

                // color: AppColors.dividerColor,
              ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total",style: TextStyle(color: Color(0xff484848),fontSize: 15.sp,fontWeight: FontWeight.w600,),),
            Text("\$365",style: TextStyle(color:AppColors.appPrimaryColor,fontSize: 16.sp,fontWeight: FontWeight.w600,fontFamily: "UrbanistBold"),),
          ],
        ).marginSymmetric(horizontal:12.w,vertical: 4.h),
              Center(
                  child: CustomButton(title: "Add Payment Method", onPressed: (){Get.to(ScreenAddCard());})).marginSymmetric(horizontal: 24.w,vertical: 30.h),
              Center(child: Text("Your payment information is secure",style: TextStyle(color: Color(0xff484848),fontSize: 15.sp,fontWeight: FontWeight.w600,),)),


            ],
          ),
        ),
      ),
    );
  }

}
Widget BookingSummary(
    String title,description
    ){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,style: TextStyle(color: Color(0xff484848).withOpacity(.7),fontSize: 15.sp,fontWeight: FontWeight.w500,),),
      Text(description,style: TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.w600,fontFamily: "UrbanistBold"),),
    ],
  ).marginSymmetric(horizontal:12.w,vertical: 4.h);

}