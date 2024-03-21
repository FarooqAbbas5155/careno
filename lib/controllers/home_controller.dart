import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController{
RxBool isPasswordVisible = false.obs;
RxBool checkBox = false.obs;
Rx<File> images = Rx<File>(File(''));
RxString selectedGender = ''.obs;
// DateTime? dateTime;
Rx<DateTime?> dateTime = Rx<DateTime?>(null);
var countryCode = "92".obs;

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