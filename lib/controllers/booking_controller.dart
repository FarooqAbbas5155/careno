import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class BookingController extends GetxController {
  Rx<String> bookingType = "Per day".obs;
  RxDouble MinTime=1.0.obs;
  RxDouble endTime=24.0.obs;
  RxDouble NewTime=1.0.obs;
  RxDouble endMinTime=1.0.obs;
  RxDouble startTime=1.0.obs;
  RxDouble  hoursDifference = 0.0.obs;

  RxDouble price = 0.0.obs;
  // RxDouble bookingPrice=1.0.obs;
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


 void calculateHoursDifference() {
   hoursDifference.value = endTime.value - startTime.value;
    if ( hoursDifference.value < 0) {
      hoursDifference.value += 24; // Adjust for cases where drop time is before pick time
    }
   hoursDifference.value =  hoursDifference.value;
  }
}