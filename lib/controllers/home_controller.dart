import 'dart:developer';
import 'dart:io';

import 'package:careno/constant/colors.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/models/add_host_vehicle.dart';
import 'package:careno/models/categories.dart';
import 'package:careno/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
import '../interfaces/like_listener.dart';
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
  RxList<Category> allCategory= RxList<Category>([]);
  RxList<AddHostVehicle> addhostvehicle= RxList<AddHostVehicle>([]);
  Stream<QuerySnapshot>? categoriesSnapshot;
  Stream<QuerySnapshot>? vehicleSnapshot;


// DateTime? dateTime;
  @override
  void onInit() {
updateToken();
UserStream();
vehicleSnapshot = addVehicleRef.snapshots();

categoriesSnapshot = categoryRef.snapshots();
addhostvehicle.bindStream(vehicleSnapshot!.map((vehicle) => vehicle.docs.map((e) => AddHostVehicle.fromMap(e.data() as Map<String, dynamic>)).toList()));

allCategory.bindStream(categoriesSnapshot!.map((category) => category.docs.map((e) => Category.fromMap(e.data() as Map<String, dynamic>)).toList()));
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

