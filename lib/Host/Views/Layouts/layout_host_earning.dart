import 'package:careno/Host/Views/Layouts/item_payment_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';

class LayoutHostEarning extends StatelessWidget {
  const LayoutHostEarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: 100.h,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
              decoration: BoxDecoration(color: AppColors.appPrimaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Earning Wallet",
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 80.h,
                left: 0.w,
                bottom: 0.h,
                right: 0.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 13.w),
                      padding: EdgeInsets.all(10.r),
                      // height: 134.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(.15),blurRadius: 20.r,offset: Offset(0, -2))
                        ]
                      ),
                      child: Column(children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text("Wallet Balance",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            color: Color(0xFF969696)
                          ),),
                          subtitle: Text("300\$",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.sp,
                            color: AppColors.appPrimaryColor
                          ),
                          ),
                          trailing: Container(
                            height: 38.h,
                            width: 124.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.appPrimaryColor,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text("Link Stripe",style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            ),),
                          ),
                        ),
                        RichText(text: TextSpan(
                          text: "Note: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 13.sp
                          ),
                          children: [
                            TextSpan(text: "Payment transfer to your local bank account, conne-cted through Active Tutors Stripe Connect Account, may take 2-3 business days.",
                              style: TextStyle(
                                  color: Color(0xFF969696),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp
                              ),
                            )
                          ]
                        ))
                      ],),
                    ).marginOnly(bottom: 10.h),
                    Divider(color: Color(0xFFBBBBBB).withOpacity(.5),thickness: .5,height: 20.h,),
                    Text("Payment History",style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.appPrimaryColor
                    ),).marginSymmetric(horizontal: 13.w,vertical: 5.h),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                        return ItemPaymentHistory();
                      },),
                    )

                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
