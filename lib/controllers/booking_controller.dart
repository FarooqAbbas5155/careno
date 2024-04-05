import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  Rx<String> bookingType = "Per day".obs;

  RxDouble startTime=1.0.obs;
  RxDouble MinTime=1.0.obs;
  RxDouble endTime=1.0.obs;
  RxDouble NewTime=1.0.obs;
  RxDouble EndTime=1.0.obs;
  RxDouble endMinTime=0.0.obs;
  RxDouble bookingPrice=1.0.obs;
  RxDouble TotalBookingPrice=0.0.obs;

  TextEditingController priceController=TextEditingController();
  Rx<DateTime?> bookingEndDate = Rx<DateTime?>(null);
  Rx<DateTime?> bookingStartDate = Rx<DateTime?>(null);
  Rx<String >paymentType = "CreditCard".obs;
  List<DateTime?> dates = [
    DateTime.now(),
    DateTime.now().add(Duration(days: 1)),
  ];
  List<DateTime?> selectDates = [
    DateTime.now(),
  ];

}
