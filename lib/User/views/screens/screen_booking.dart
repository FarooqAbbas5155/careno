import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:careno/User/views/screens/screen_booking_review.dart';
import 'package:careno/constant/colors.dart';
import 'package:careno/controllers/booking_controller.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/helpers.dart';

class ScreenBooking extends StatefulWidget {
  @override
  State<ScreenBooking> createState() => _ScreenBookingState();
}

class _ScreenBookingState extends State<ScreenBooking> {
  final BookingController controller = Get.put(BookingController());

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
                    "Bookings as",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "UrbanistBold",
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
                              value: "Per day",
                              groupValue: controller.BookingSelection.value,
                              onChanged: (String? value) {
                                print("Radio button changed to: $value");
                                controller.BookingSelection.value = value!;
                              },
                            ),
                            Text(
                              "Per Day",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "UrbanistBold"),
                            )
                          ],
                        ),
                        Text(
                          "\$ 50",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
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
                              groupValue: controller.BookingSelection.value,
                              onChanged: (String? value) {
                                controller.BookingSelection.value = value!;
                              },
                            ),
                            Text(
                              "Per Hour",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "UrbanistBold"),
                            )
                          ],
                        ),
                        Text(
                          "\$ 150",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Select Date or Day",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "UrbanistBold",
                    ),
                  ),
                  Obx(() => controller.BookingSelection.value == "Per day"
                      ? CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            centerAlignModePicker: true,
                            lastMonthIcon: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: AppColors.appPrimaryColor)),
                                child: CustomSvg(
                                  name: "back",
                                )),
                            nextMonthIcon: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: AppColors.appPrimaryColor)),
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
                          onValueChanged: (dates) => controller.dates = dates,
                        )
                      : CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            centerAlignModePicker: true,
                            lastMonthIcon: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: AppColors.appPrimaryColor)),
                                child: CustomSvg(
                                  name: "back",
                                )),
                            nextMonthIcon: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: AppColors.appPrimaryColor)),
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
                          onValueChanged: (dates) => controller.selectDates = dates,
                        )),
                  Text(
                    "Select Time",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: "UrbanistBold",
                    ),
                  ),

                ],
              ).marginSymmetric(horizontal: 19.w, vertical: 10.h),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 19.w),
                decoration:
                BoxDecoration(color: Color(0xFFD9D9D9).withOpacity(.15)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pick-Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Color(0xFF1A1B1B).withOpacity(.6)),
                        ),
                        Expanded(
                          child: Obx(() {
                            return Slider(
                                min: 0,
                                max: 12,
                                value: controller.startTime.value,
                                onChanged: (value) {
                                  controller.startTime.value = value;
                                });
                          }),
                        ),
                        Obx(() {
                          return Text(
                            "${controller.startTime.value.toStringAsFixed(0)}:00 AM",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: Color(0xFF1A1B1B)),
                          );
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Drop-off",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Color(0xFF1A1B1B).withOpacity(.6)),
                        ),
                        Expanded(
                          child: Obx(() {
                            return Slider(
                                min: 0,
                                max: 12,
                                value: controller.endTime.value,
                                onChanged: (value) {
                                  controller.endTime.value = value;
                                });
                          }),
                        ),
                        Text(
                          "${controller.endTime.value.toStringAsFixed(0)}:00 PM",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: Color(0xFF1A1B1B)),
                        ),
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

                  Text("Subtotal Price",style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600
                ),),
                  Text("\$ 350",style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                    color: AppColors.appPrimaryColor
                ),)
                ],
              ).marginSymmetric(horizontal: 20.w,vertical: 15.h),
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

  void _showDateRangePicker(BuildContext context) {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now().subtract(const Duration(days: 30)),
      maximumDate: DateTime.now().add(const Duration(days: 30)),
      endDate: controller.endDate.value,
      // Assuming endDate is an observable in the controller
      startDate: controller.startDate.value,
      // Assuming startDate is an observable in the controller
      backgroundColor: Colors.white,
      primaryColor: Colors.green,
      onApplyClick: (start, end) {
        controller.endDate.value =
            end; // Assuming endDate is an observable in the controller
        controller.startDate.value =
            start; // Assuming startDate is an observable in the controller
      },
      onCancelClick: () {
        controller.endDate.value =
            null; // Assuming endDate is an observable in the controller
        controller.startDate.value =
            null; // Assuming startDate is an observable in the controller
      },
    );
  }
}
