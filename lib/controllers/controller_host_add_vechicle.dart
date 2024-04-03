import 'dart:io';

import 'package:careno/constant/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Host/Views/Screens/screen_host_home_page.dart';
import '../constant/firebase_utils.dart';
import '../models/add_host_vehicle.dart';

class ControllerHostAddVechicle extends GetxController {
  Rx<TextEditingController> vehicleModel = TextEditingController().obs;
  Rx<TextEditingController> vehicleYear = TextEditingController().obs;
  Rx<TextEditingController> vehicleSeats = TextEditingController().obs;
  Rx<TextEditingController> vehicleNumberPlate = TextEditingController().obs;
  Rx<TextEditingController> vehicleColor = TextEditingController().obs;
  Rx<TextEditingController> vehicleLicenseExpiryDate = TextEditingController().obs;
  Rx<TextEditingController> vehiclePerDayRent = TextEditingController().obs;
  Rx<TextEditingController> vehiclePerHourRent = TextEditingController().obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address = ''.obs;
  List<String> imageList = [];

  RxString vehiclePath = "".obs;
  RxString vehicleRightSidePaths = "".obs;
  RxString vehicleInteriorPaths = "".obs;
  RxList<String> vehicleMore = RxList([]);
  RxString vehicleRearPaths = "".obs;
  RxString vehicleNumberPlatePath = "".obs;
  RxString vehicleRegistrationProofPath = "".obs;
  RxString selectCategory = "".obs;
  RxString selectFuelType = "".obs;
  RxString selectTransmission = "".obs;
  RxBool showLoading = false.obs;
  String response = "";

  Future<String> hostAddVehicle() async {
    String response = "";
    if (vehicleModel.value.text.isEmpty ||
        vehicleYear.value.text.isEmpty ||
        vehicleSeats.value.text.isEmpty ||
        vehicleNumberPlate.value.text.isEmpty ||
        vehicleColor.value.text.isEmpty ||
        vehicleLicenseExpiryDate.value.text.isEmpty ||
        vehiclePerDayRent.value.text.isEmpty ||
        vehiclePerHourRent.value.text.isEmpty ||
        vehiclePath.value.isEmpty ||
        vehicleRightSidePaths.value.isEmpty ||
        vehicleInteriorPaths.value.isEmpty ||
        vehicleRearPaths.value.isEmpty ||
        vehicleNumberPlatePath.value.isEmpty ||
        vehicleRegistrationProofPath.value.isEmpty ||
        selectCategory.value.isEmpty ||
        selectFuelType.value.isEmpty ||
        selectTransmission.value.isEmpty) {
      response = "All Fields Required";
    } else {
      showLoading.value = true;
      int id = DateTime.now().millisecondsSinceEpoch;
      String userId = FirebaseAuth.instance.currentUser!.uid;

      String vehiclePathUrl = await FirebaseUtils.uploadImage(vehiclePath.value,
          "User/Host/${userId}/addVehicle/${id}/vehiclePath");
      String vehicleRightSidePathsUrl = await FirebaseUtils.uploadImage(
          vehicleRightSidePaths.value,
          "User/Host/${userId}/addVehicle/${id}/vehicleRightSidePaths");
      String vehicleInteriorPathsUrl = await FirebaseUtils.uploadImage(
          vehicleInteriorPaths.value,
          "User/Host/${userId}/addVehicle/${id}/vehicleInteriorPaths");
      String vehicleNumberPlatePathUrl = await FirebaseUtils.uploadImage(
          vehicleNumberPlatePath.value,
          "Host/addVehicle/${userId}/${id}/image/vehicleNumberPlatePath");
      String vehicleRegistrationProofPathUrl = await FirebaseUtils.uploadImage(
          vehicleRegistrationProofPath.value,
          "Host/addVehicle/${userId}/${id}/image/vehicleRegistrationProofPath");
      String vehicleRearPathsUrl = await FirebaseUtils.uploadImage(
          vehicleRearPaths.value,
          "Host/addVehicle/${userId}/${id}/image/vehicleRearPaths");
      AddHostVehicle addHostVehicle = AddHostVehicle(
          hostId: userId,
          vehicleId: id.toString(),
          vehicleImageComplete: vehiclePathUrl,
          vehicleImageNumberPlate: vehicleNumberPlatePathUrl,
          vehicleImageRightSide: vehicleRightSidePathsUrl,
          vehicleImageRear: vehicleRearPathsUrl,
          vehicleImageInterior: vehicleInteriorPathsUrl,
          vehicleModel: vehicleModel.value.text.trim(),
          vehicleSeats: vehicleSeats.value.text.trim(),
          vehicleCategory: selectCategory.value,
          vehicleYear: vehicleYear.value.text.trim(),
          vehicleTransmission: selectTransmission.value,
          vehicleFuleType: selectFuelType.value,
          vehicleNumberPlate: vehicleNumberPlate.value.text.trim(),
          vehicleColor: vehicleColor.value.text.trim(),
          vehicleLicenseExpiryDate: vehicleLicenseExpiryDate.value.text.trim(),
          vehiclePerDayRent: vehiclePerDayRent.value.text.trim(),
          vehiclePerHourRent: vehiclePerHourRent.value.text.trim(),
          vehicleRegistrationImage: vehicleRegistrationProofPathUrl,
          status:"Pending",
          rating: 0.0, latitude: latitude.value,longitude: longitude.value
      );
      await addVehicleRef
          .doc(id.toString())
          .set(addHostVehicle.toMap())
          .then((value) {
        response = "success";
        print(response);
        showLoading.value = false;
        Get.offAll(ScreenHostHomePage());
      }).catchError((error) {
        response = error.toString();
        showLoading.value = false;

        print(response);
      });
    }
    return response;
  }

  void submitForm() {
    // Check if any of the required fields are empty

    showLoading.value = false;
    return;

    // Proceed with form submission or any other action since all fields are filled
  }
}
