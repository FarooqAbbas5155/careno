import 'dart:ffi';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:careno/User/views/screens/screen_booking_review.dart';
import 'package:careno/constant/MyFonts.dart';
import 'package:careno/constant/colors.dart';
import 'package:careno/controllers/booking_controller.dart';
import 'package:careno/models/add_host_vehicle.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:careno/widgets/custom_textfiled.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/helpers.dart';

class ScreenBooking extends StatelessWidget {
  AddHostVehicle addHostVehicle;

  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    // controller.priceController=addHostVehicle.
    if (controller.bookingType.value == "Per day") {
      controller.bookingPrice.value =
          double.parse(addHostVehicle.vehiclePerDayRent);
    }
    controller.bookingPrice.value =
        double.parse(addHostVehicle.vehiclePerHourRent);

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
            "Bookings",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "UrbanistBold",
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Booked As",
                    style: MyFont.heading18,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: primaryColor,
                              value: "Per day",
                              groupValue: controller.bookingType.value,
                              onChanged: (String? value) {
                                print("Radio button changed to: $value");
                                controller.bookingType.value = value!;
                                controller.endMinTime.value = 0.0;
                                controller.bookingPrice.value = double.parse(
                                    addHostVehicle.vehiclePerDayRent);

                                controller.update();
                              },
                            ),
                            Text(
                              "Per Day",
                              style: MyFont.heading16,
                            )
                          ],
                        ),
                        Text(
                          "\$ ${addHostVehicle.vehiclePerDayRent}",
                          style: MyFont.heading18
                              .copyWith(color: AppColors.appPrimaryColor),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: primaryColor,
                              value: "Per hour",
                              groupValue: controller.bookingType.value,
                              onChanged: (String? value) {
                                controller.bookingType.value = value!;
                                controller.bookingPrice.value = double.parse(
                                    addHostVehicle.vehiclePerHourRent);

                                controller.update();
                              },
                            ),
                            Text(
                              "Per Hour",
                              style: MyFont.heading16,
                            )
                          ],
                        ),
                        Text(
                          "\$ ${addHostVehicle.vehiclePerHourRent}",
                          style: MyFont.heading18
                              .copyWith(color: AppColors.appPrimaryColor),
                        )
                      ],
                    ),
                  ),
                  Obx(() {
                    return Text("Booking Price ${controller.bookingType.value}",
                        style: MyFont.heading18);
                  }).marginSymmetric(vertical: 5.h),
                  Obx(() {
                    return CustomTextField(
                      controller: controller.priceController
                        ..text = controller.bookingType.value == "Per day"
                            ? "${addHostVehicle.vehiclePerDayRent}"
                            : "${addHostVehicle.vehiclePerHourRent}",
                      // text: ,
                    );
                  }).marginSymmetric(vertical: 5.h),
                  Text(
                    "Select Date or Day",
                    style: MyFont.heading18,
                  ).marginSymmetric(vertical: 5.h),
                  Obx(() => controller.bookingType.value == "Per day"
                      ? CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            centerAlignModePicker: true,
                            firstDate: DateTime.now(),
                            currentDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            lastMonthIcon: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.appPrimaryColor)),
                                child: CustomSvg(
                                  name: "back",
                                )),
                            nextMonthIcon: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.appPrimaryColor)),
                                child: CustomSvg(
                                  name: "next",
                                )),
                            yearTextStyle: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15.sp),
                            dayTextStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1B1B)),
                            calendarType: CalendarDatePicker2Type.range,
                          ),
                          value: controller.dates,
                          onValueChanged: (dates) {
                            controller.dates = dates;
                            controller.bookingStartDate.value = dates[0];
                            controller.bookingEndDate.value = dates[1];
                            int difference =
                                dates[1]!.difference(dates[0]!).inDays;
                            controller.bookingPrice.value = double.tryParse(
                                    "${controller.priceController.text}")! *
                                difference;
                          },
                        )
                      : CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            centerAlignModePicker: true,
                            firstDate: DateTime.now(),
                            currentDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            lastMonthIcon: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.appPrimaryColor)),
                                child: CustomSvg(
                                  name: "back",
                                )),
                            nextMonthIcon: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.appPrimaryColor)),
                                child: CustomSvg(
                                  name: "next",
                                )),
                            yearTextStyle: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15.sp),
                            dayTextStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1B1B)),
                            calendarType: CalendarDatePicker2Type.single,
                          ),
                          value: controller.selectDates,
                          onValueChanged: (dates) =>
                              controller.selectDates = dates,
                        )),
                  Text(
                    "Select Time",
                    style: MyFont.heading18,
                  ),
                ],
              ).marginSymmetric(horizontal: 19.w, vertical: 10.h),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 19.w),
                decoration:
                    BoxDecoration(color: Color(0xFFD9D9D9).withOpacity(.15)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pick-Up",
                          style: MyFont.heading12,
                        ),
                        Expanded(
                          child: Obx(() {
                            return Slider(
                              min: controller.MinTime.value,
                              max: 24,
                              divisions: 24,
                              value: controller.startTime.value.clamp(1, 24),
                              // Clamp value within range
                              onChanged: (value) {
                                controller.startTime.value = value;
                                startTime = int.parse(controller.startTime.value
                                    .toStringAsFixed(0));
                                if (EndTime > startTime) {
                                  controller.NewTime.value =
                                      (EndTime - startTime).toDouble();
                                  controller.TotalBookingPrice.value =
                                      controller.bookingPrice.value *
                                          controller.NewTime.value;
                                  print(
                                      "New Booking price   ${controller.TotalBookingPrice.value.toStringAsFixed(0)}");
                                  return;
                                } else {
                                  controller.NewTime.value =
                                      startTime - EndTime.toDouble();
                                  controller.TotalBookingPrice.value =
                                      controller.bookingPrice.value *
                                          controller.NewTime.value;
                                  print(
                                      "New Booking price${controller.TotalBookingPrice.value.toStringAsFixed(0)}");
                                  return;
                                }

                                // controller.startTime.value = value;
                                // if (controller.bookingType.value == "Per day") {
                                //   controller.endTime.value = controller.startTime.value;
                                // } else {
                                //   controller.endMinTime.value = controller.startTime.value + 1;
                                //   // Ensure endMinTime.value remains within range
                                //   if (controller.endMinTime.value > 23) {
                                //     controller.endMinTime.value = 23;
                                //   }
                                // }
                              },
                            );
                          }),
                        ),
                        Obx(() {
                          return Row(
                            children: [
                              Text(
                                "${controller.startTime.value.toStringAsFixed(0)}:00 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: Color(0xFF1A1B1B)),
                              ),
                              Container(
                                height: 40.h,
                                width: 50.w,
                                child: Row(
                                  children: [
                                    Expanded(child: Text(controller.StarttimeDimension.value)),
                                    Expanded(
                                      child: PopupMenuButton(
                                        icon: Icon(Icons.expand_more),
                                        color: Theme.of(context).primaryColor,
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            'AM',
                                            'PM',
                                          ].map((String choice) {
                                            return PopupMenuItem<String>(
                                              value: choice,
                                              child: Text(
                                                choice,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Urbanist"),
                                              ),
                                            );
                                          }).toList();
                                        },
                                        onSelected: (String choice) {
                                          // Update selected gender when an option is chosen
                                          controller.StarttimeDimension.value = choice;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Drop-off",
                          style: MyFont.heading12,
                        ),
                        Expanded(
                          child: Obx(() {
                            return Slider(
                              min: controller.endMinTime.value,
                              // controller.endMinTime.value.clamp(1, 24), // Clamp min within range
                              max: 24,
                              divisions: 24,
                              value: controller.endTime.value.clamp(1, 24),
                              // Clamp value within range
                              onChanged: (value) {
                                controller.endTime.value = value;
                                EndTime = int.parse(controller.endTime.value
                                    .toStringAsFixed(0));
                                if (EndTime > startTime) {
                                  controller.NewTime.value =
                                      (EndTime - startTime).toDouble();
                                  controller.TotalBookingPrice.value =
                                      controller.bookingPrice.value *
                                          controller.NewTime.value;
                                  print(
                                      "New Booking price   ${controller.TotalBookingPrice.value.toStringAsFixed(0)}");
                                  return;
                                } else {
                                  controller.NewTime.value =
                                      startTime - EndTime.toDouble();
                                  controller.TotalBookingPrice.value =
                                      controller.bookingPrice.value *
                                          controller.NewTime.value;
                                  print(
                                      "New Booking price${controller.TotalBookingPrice.value.toStringAsFixed(0)}");
                                  return;
                                }
                                //   if (controller.bookingType.value=="Per day") {
                                //
                                //   }
                                //   else{
                                //     controller.endTime.value = value;
                                //     int endTime = int.tryParse("${controller.endTime.value.toStringAsFixed(0)}")!;
                                //     int startTime = int.tryParse("${controller.startTime.value.toStringAsFixed(0)}")!;
                                //     controller.bookingPrice.value = double.tryParse("${controller.priceController.text}")! * endTime-startTime;
                                // print(controller.startTime.value.toStringAsFixed(0));
                                //   }
                              },
                            );
                          }),
                        ),
                        Obx(() {
                          return Row(
                            children: [
                              Text(
                                "${controller.endTime.value.toStringAsFixed(0)}:00 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                    color: Color(0xFF1A1B1B)),
                              ),
                              Container(
                                height: 40.h,
                                width: 50.w,
                                child: Row(
                                  children: [
                                    Expanded(child: Text(controller.EndtimeDimension.value)),
                                    Expanded(
                                      child: PopupMenuButton(
                                        icon: Icon(Icons.expand_more),
                                        color: Theme.of(context).primaryColor,
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            'AM',
                                            'PM',
                                          ].map((String choice) {
                                            return PopupMenuItem<String>(
                                              value: choice,
                                              child: Text(
                                                choice,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Urbanist"),
                                              ),
                                            );
                                          }).toList();
                                        },
                                        onSelected: (String choice) {
                                          // Update selected gender when an option is chosen
                                          controller.EndtimeDimension.value = choice;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
              DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Color(0xFFCFCFCF),
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Subtotal Price",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  Obx(() {
                    return Text(
                      "\$ ${controller.bookingPrice.value.toStringAsFixed(0)}",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.appPrimaryColor),
                    );
                  })
                ],
              ).marginSymmetric(horizontal: 20.w, vertical: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Subtotal Price",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  Obx(() {
                    return Text(
                      "\$ ${controller.TotalBookingPrice.value.toStringAsFixed(0)}",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.appPrimaryColor),
                    );
                  })
                ],
              ).marginSymmetric(horizontal: 20.w, vertical: 15.h),
              CustomButton(
                  title: "Next",
                  onPressed: () {
                    Get.to(ScreenBookingReview());
                  }).marginSymmetric(vertical: 10.h)
            ],
          ),
        ),
      ),
    );
  }

  int startTime = 0;
  int EndTime = 0;

  ScreenBooking({
    required this.addHostVehicle,
  });
}
