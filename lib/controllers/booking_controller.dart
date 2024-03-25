import 'package:get/get.dart';

class BookingController extends GetxController {
  Rx<String> BookingSelection = "".obs;
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<String >paymentType = "CreditCard".obs;
}
