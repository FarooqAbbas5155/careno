import 'package:careno/User/views/screens/screen_add_card.dart';
import 'package:careno/constant/colors.dart';
import 'package:careno/controllers/booking_controller.dart';
import 'package:careno/controllers/controller_payments.dart';
import 'package:careno/controllers/payment_controller_2nd.dart';
import 'package:careno/extensions/num_extensions.dart';
import 'package:careno/models/add_host_vehicle.dart';
import 'package:careno/models/booking.dart';
import 'package:careno/models/user.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constant/helpers.dart';

class ScreenBookingReview extends StatelessWidget {
  AddHostVehicle addHostVehicle;
  BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    var percentageValue = controller.price.value / 100 *
        controller.percentage.value;
    controller.TotalVehicleRent.value =
        percentageValue + controller.price.value;
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
        body: FutureBuilder<User>(
            future: getUser(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.appPrimaryColor,
                  strokeWidth: 1,
                ),);
              }
              var user = snapshot.data;
              return Container(
                height: 640.h,
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
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
                      padding: EdgeInsets.only(left: 12.0),
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
                                style: TextStyle(color: Color(0xff484848),
                                    fontFamily: "UrbanistBold",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp),),
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
                                style: TextStyle(color: Color(0xff484848),
                                    fontFamily: "UrbanistBold",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp),),
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
                      padding: EdgeInsets.only(left: 12.0),
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
                    controller.bookingType.value == "Per Day" ? Column(
                      children: [
                        BookingSummary("Start Date", dateFormat(controller
                            .bookingStartDate.value!)),
                        BookingSummary("End Date", dateFormat(controller
                            .bookingEndDate
                            .value!)),
                      ],
                    ) : BookingSummary("Start Date",
                        dateFormat(controller.bookingStartDateHour.value!)),

                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pick-up Time", style: TextStyle(
                            color: Color(0xff484848).withOpacity(.7),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,),),

                          Row(
                            children: [
                              controller.bookingType.value == "Per hour" ? Text(
                                "${controller.startTime.value.toStringAsFixed(
                                    0)}:00 ",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "UrbanistBold"),
                              ) : Text(
                                "${controller.EndTimeDay1.value.toStringAsFixed(
                                    0)}:00 ",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "UrbanistBold"),
                              ),
                              controller.bookingType.value == "Per hour" ? Text(
                                controller.startTime.value > 12 ? "PM" : "AM",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "UrbanistBold"),) : Text(
                                controller.EndTimeDay1.value > 12 ? "PM" : "AM",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "UrbanistBold"),),

                            ],
                          ),
                        ],
                      );
                    }).marginSymmetric(horizontal: 12.w, vertical: 4.h),
                    // controller.bookingType.value == "Per hour"? BookingSummary("Pick-up Time", "10:00 AM"),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Drop-off Time", style: TextStyle(
                            color: Color(0xff484848).withOpacity(.7),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,),),

                          Row(
                            children: [
                              controller.bookingType.value == "Per hour" ? Text(
                                "${controller.endMinTime.value.toStringAsFixed(
                                    0)}:00 ",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "UrbanistBold"),
                              ) : Text(
                                "${controller.EndTimeDay2.value.toStringAsFixed(
                                    0)}:00 ",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "UrbanistBold"),
                              ),
                              controller.bookingType.value == "Per hour" ? Text(
                                controller.endMinTime.value > 12 ? "PM" : "AM",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "UrbanistBold"),) : Text(
                                controller.EndTimeDay2.value > 12 ? "PM" : "AM",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "UrbanistBold"),),

                            ],
                          ),
                        ],
                      );
                    }).marginSymmetric(horizontal: 12.w, vertical: 4.h),

                    Divider(
                      indent: 1,
                      endIndent: 1,
                      color: Color(0xffEDEEEE),

                      // color: AppColors.dividerColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
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
                    BookingSummary(
                        "Subtotal",
                        "\$${controller.price.value.toStringAsFixed(0)}"),
                    BookingSummary("Service Fee", "\$${percentageValue}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: TextStyle(color: Color(0xff484848),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,),),
                        Text("\$${controller.TotalVehicleRent.value.round()}",
                          style: TextStyle(color: AppColors.appPrimaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "UrbanistBold"),),
                      ],
                    ).marginSymmetric(horizontal: 12.w, vertical: 4.h),
                    Center(
                        child: CustomButton(
                            title: "Add Payment Method", onPressed: () async {
                          await PaymentsController2().makePayment(
                              controller.TotalVehicleRent.value.round()
                                  .toString(), "NOK",
                              onSuccess: (infoData) {
                                print(infoData);
                              }, onError: (error) {
                            return;
                          }).then((value) {
                            int id = DateTime.now().millisecondsSinceEpoch;
                            DateTime startTimeDate = DateTime(controller.bookingStartDate.value!.year,controller.bookingStartDate.value!.month,controller.bookingStartDate.value!.day);


                            Booking booking = Booking(bookingId: id.toString(),
                                vehicleId: addHostVehicle.vehicleId,
                                userId: user!.uid,
                                hostId: addHostVehicle.hostId,
                                bookingStatus: "Pending",
                                paymentStatus: "Booking",
                                bookingType: "Booking",
                                bookingStartDate:startTimeDate.millisecondsSinceEpoch ,
                                bookingEndDate: controller.bookingType=="Per Day"?(controller.bookingEndDate.value!.millisecondsSinceEpoch):controller.selectDates[0]!.add(Duration(hours: controller.endTime.toInt()-controller.startTime.value.toInt())).millisecondsSinceEpoch,
                                completed: false,
                                startTime: controller.startTime.value.toInt(),
                                EndTime: controller.endTime.value.toInt(),
                                price: controller.price.value);
                          });

                          // Get.to(ScreenAddCard());
                        })).marginSymmetric(horizontal: 24.w, vertical: 30.h),
                    Center(child: Text("Your payment information is secure",
                      style: TextStyle(color: Color(0xff484848),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,),)),


                  ],
                ),
              );
            }),
      ),
    );
  }

  ScreenBookingReview({
    required this.addHostVehicle,
  });
}

Widget BookingSummary(String title, description) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: TextStyle(color: Color(0xff484848).withOpacity(.7),
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,),),
      Text(description, style: TextStyle(color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "UrbanistBold"),),
    ],
  ).marginSymmetric(horizontal: 12.w, vertical: 4.h);
}