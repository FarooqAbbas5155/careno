import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerEditProfile extends GetxController{

  Rx<DateTime?> dateTime = Rx<DateTime?>(null);
  RxString selectedGender = ''.obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 1,01),
        lastDate: DateTime(2101,12,01));
    if (picked != null && picked != dateTime) {

      dateTime.value = picked;

    }
  }

}