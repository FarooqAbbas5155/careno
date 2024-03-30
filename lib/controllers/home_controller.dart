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
  RxBool isPasswordVisible = false.obs;
  RxBool checkBox = false.obs;
  Rx<File> images = Rx<File>(File(''));
  // final RxString images = ''.obs;

  RxString selectedGender = ''.obs;
  double latitude = 0.0;
  double longitude = 0.0;
  RxBool permissionStatus = false.obs;
  var selectedRange = RangeValues(10, 60).obs;
  Rx<TextEditingController> fullName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  RxInt selectIndex = 0.obs;
  Rx<TextEditingController> profileDescription = TextEditingController().obs;
  var carList = ["Sedan", "Electric Car", "Trucks", "SUVS"].obs;
  RxString userType = 'user'.obs;
  Rx<String> popularVehicle = 'popularVehicle'.obs;
  Rx<String> Cartype = 'Toyota'.obs;
  Rx<String> CarBrand = 'Toyota'.obs;
  Rx<String> CarModel = '2019'.obs;
  Rx<String> CarTransmission = 'Automatic'.obs;
  Rx<String> CarFuelType = 'Gasoline'.obs;
  Rx<String> CarSeatsCapacity = '04'.obs;
  Rx<String> CarLocation = 'Central park New York'.obs;

// DateTime? dateTime;
  Rx<DateTime?> Dob = Rx<DateTime?>(null);

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 1, 01),
        lastDate: DateTime(2101, 12, 01));
    if (picked != null && picked != Dob) {
      Dob.value = picked;
    }
  }

  Future<void> UpdateProfileData() async {
    String name = fullName.value.text.trim();
    String userEmail = email.value.text.trim();
    String description = profileDescription.value.text.trim();

    if (name.isEmpty && userEmail.isEmpty && description.isEmpty && Dob.value == null && selectedGender.isEmpty && images.value == null) {
      Get.snackbar("Alert", "All Fields Required");
      return; // Return here to exit the function if fields are empty
    }

    try {
      // String imagePath = images.value.toString();
      // File imageFile = File(imagePath);
      //
      // print("Image Path: $imagePath");
      //
      // if (!imageFile.existsSync()) {
      //   print("Image file does not exist.");
      //   Get.snackbar("Alert", "Image file does not exist.", backgroundColor: AppColors.appPrimaryColor,colorText: Colors.white);
      //   return;
      // }
      //
      // String url = await FirebaseUtils.uploadImage(imagePath, "Careno/ProfileImages/${FirebaseUtils.myId}/image");

      await usersRef.doc(uid).update({
        "name": name,
        "email": userEmail,
        "profileDescription": description,
        "imageUrl": "url",
        "dob": Dob.value!.millisecondsSinceEpoch,
        "gender": selectedGender.value,
        "lat":latitude,
        "lng":longitude,
      });

      if (userType.value == "host") {
        Get.to(ScreenHostAddIdentIdentityProof());
      } else {
        Get.to(ScreenUserHome());
      }

      Get.snackbar("Successfully", "Updated Your Profile", backgroundColor: AppColors.appPrimaryColor);
    } catch (error) {
      Get.snackbar("Alert", "${error.toString()}", backgroundColor: AppColors.appPrimaryColor);
      print(error);
    }
  }
}