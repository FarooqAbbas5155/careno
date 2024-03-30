import 'dart:io';

import 'package:careno/constant/colors.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Host/Views/Screens/screen_host_add_ident_identity_proof.dart';
import '../User/views/screens/screen_user_home.dart';
import '../constant/firebase_utils.dart';

class HomeController extends GetxController {







  var selectedRange = RangeValues(10, 60).obs;

  RxInt selectIndex = 0.obs;
  var carList = ["Sedan", "Electric Car", "Trucks", "SUVS"].obs;
  Rx<String> popularVehicle = 'popularVehicle'.obs;
  Rx<String> Cartype = 'Toyota'.obs;
  Rx<String> CarBrand = 'Toyota'.obs;
  Rx<String> CarModel = '2019'.obs;
  Rx<String> CarTransmission = 'Automatic'.obs;
  Rx<String> CarFuelType = 'Gasoline'.obs;
  Rx<String> CarSeatsCapacity = '04'.obs;
  Rx<String> CarLocation = 'Central park New York'.obs;

// DateTime? dateTime;


}