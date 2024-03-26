import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:careno/User/views/screens/screen_booking_review.dart';
import 'package:careno/controllers/booking_controller.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tuna_flutter_range_slider/tuna_flutter_range_slider.dart';

import '../../../constant/helpers.dart';

class ScreenBooking extends StatefulWidget {
  @override
  State<ScreenBooking> createState() => _ScreenBookingState();
}

class _ScreenBookingState extends State<ScreenBooking> {
  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
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
          Text(
            controller.startDate.value != null
                ? DateFormat.yMMMd().format(controller.startDate.value!)
                : "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "UrbanistBold",
            ),
          ),
          Obx(() => controller.BookingSelection.value == "Per day"?
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
            ),
            value: controller.dates,
            onValueChanged: (dates) => controller.dates = dates,
          ):CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2050), onDateChanged: (date){

          })
          ),
          CustomButton(
              title: "Next",
              onPressed: () {
                Get.to(ScreenBookingReview());
              })
        ],
      ).marginSymmetric(horizontal: 19.w, vertical: 10.h),
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
