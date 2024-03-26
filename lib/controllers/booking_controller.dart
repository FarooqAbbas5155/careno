import 'package:get/get.dart';

class BookingController extends GetxController {
  Rx<String> BookingSelection = "Per day".obs;
  RxDouble startTime=1.0.obs;
  RxDouble endTime=1.0.obs;
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<String >paymentType = "CreditCard".obs;
  List<DateTime?> dates = [
    DateTime.now(),
    DateTime.now().add(Duration(days: 1)),
  ];
  List<DateTime?> selectDates = [
    DateTime.now(),
  ];

}
