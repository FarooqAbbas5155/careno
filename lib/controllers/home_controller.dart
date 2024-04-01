import 'dart:developer';
import 'dart:io';

import 'package:careno/constant/colors.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Host/Views/Screens/screen_host_add_ident_identity_proof.dart';
import '../User/views/screens/screen_user_home.dart';
import '../constant/fcm.dart';
import '../constant/firebase_utils.dart';
import '../models/user.dart' as model;

class HomeController extends GetxController {
  RxInt selectHostIndex=0.obs;

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
  @override
  void onInit() {
updateToken();
UserStream();

super.onInit();
  }
  String uid = FirebaseAuth.instance.currentUser!.uid;

  void updateToken() async {
    var token = (await FCM.generateToken()) ?? "";
    usersRef.doc(uid).update({"notificationToken": token});
  }

  void UserStream() {
    usersRef.doc(uid).snapshots().listen((event) {
      user.value = model.User.fromMap(event.data() as Map<String, dynamic>);
      log("${user.value}");
    });
  }
  Rx<model.User?> user = Rx<model.User?>(null);

}
