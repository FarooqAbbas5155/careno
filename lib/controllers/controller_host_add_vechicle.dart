
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
  Rx<TextEditingController> vehicleLicenseExpiryDate =
      TextEditingController().obs;
  Rx<TextEditingController> vehiclePerDayRent = TextEditingController().obs;
  Rx<TextEditingController> vehiclePerHourRent = TextEditingController().obs;
  Rx<TextEditingController> vehicleDescription = TextEditingController().obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address = ''.obs;

  RxString vehiclePath = "".obs;
  RxString vehicleRightSidePaths = "".obs;
  RxString vehicleInteriorPaths = "".obs;
  RxList<String> vehicleMore = RxList([]);
  RxList<String> imagesUrl = RxList([]);
  RxList<String> uploadedimageUrl= RxList([]);
  RxList<String> uploadedandimagesUrl= RxList([]);
  RxString vehicleRearPaths = "".obs;
  RxString vehicleNumberPlatePath = "".obs;
  RxString vehicleRegistrationProofPath = "".obs;
  RxString selectCategory = "".obs;
  RxString selectCategoryName = "".obs;
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
        address.value.isEmpty ||
        vehicleDescription.value.text.isEmpty ||
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
      imagesUrl.value = await FirebaseUtils.uploadMultipleImage(
        vehicleMore.value,
        "Host/addVehicle/${userId}/${id}/image/imageList",
        extension: "png",
      );

      AddHostVehicle addHostVehicle = AddHostVehicle(
        hostId: userId,
        address: address.value,
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
        vehicleNumberPlate: vehicleNumberPlate.value.text.trim(),
        vehicleColor: vehicleColor.value.text.trim(),
        vehicleLicenseExpiryDate: vehicleLicenseExpiryDate.value.text.trim(),
        vehiclePerDayRent: vehiclePerDayRent.value.text.trim(),
        vehiclePerHourRent: vehiclePerHourRent.value.text.trim(),
        vehicleRegistrationImage: vehicleRegistrationProofPathUrl,
        status: "Pending",
        rating: 0.0,
        latitude: latitude.value,
        longitude: longitude.value,
        vehicleFuelType: selectFuelType.value,
        imagesUrl: imagesUrl.value,
        vehicleDescription: vehicleDescription.value.text.trim(),
      );
      await addVehicleRef
          .doc(id.toString())
          .set(addHostVehicle.toMap())
          .then((value) {
        response = "success";
        resetAllVehicleState();
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


  void resetAllVehicleState() {
    vehicleModel.value.clear();
    vehicleYear.value.clear();
    vehicleSeats.value.clear();
    vehicleNumberPlate.value.clear();
    vehicleColor.value.clear();
    vehicleLicenseExpiryDate.value.clear();
    vehiclePerDayRent.value.clear();
    vehiclePerHourRent.value.clear();
    vehicleDescription.value.clear();
    latitude.value = 0.0;
    longitude.value = 0.0;
    address.value = '';

    vehiclePath.value = '';
    vehicleRightSidePaths.value = '';
    vehicleInteriorPaths.value = '';
    vehicleMore.clear();
    imagesUrl.clear();
    vehicleRearPaths.value = '';
    vehicleNumberPlatePath.value = '';
    vehicleRegistrationProofPath.value = '';
    selectCategory.value = '';
    selectCategoryName.value = '';
    selectFuelType.value = '';
    selectTransmission.value = '';
  }

  Future<String> UpdateVehicle(String id,hostId)async{
    String _response = "";
    print("vehiclePath.value   ${vehiclePath.value}");
    if(vehiclePath.value.isNotEmpty){
      showLoading.value =true;
      String vehiclePathUrl = await FirebaseUtils.uploadImage(vehiclePath.value,
          "User/Host/${hostId}/addVehicle/${id}/vehiclePath");

      await addVehicleRef.doc(id).update({"vehicleImageComplete":vehiclePathUrl});
      await _updateCommonData(id).then((value) {
        showLoading.value =false;
        _response = "success";

      }).catchError((error){
        print(error.toString());
        showLoading.value = false;
      });
    }
    else if (  vehicleRightSidePaths.value.isNotEmpty) {
      showLoading.value =true;
      String vehicleRightSidePathsUrl = await FirebaseUtils.uploadImage(
          vehicleRightSidePaths.value,
          "User/Host/${hostId}/addVehicle/${id}/vehicleRightSidePaths");
      await addVehicleRef.doc(id).update({"vehicleImageRightSide":vehicleRightSidePathsUrl});
      await _updateCommonData(id).then((value) {
        showLoading.value =false;
        _response = "success";

      }).catchError((error){
        print(error.toString());
        showLoading.value = false;
      });
    }

   else if (  vehicleInteriorPaths.value.isNotEmpty) {
     showLoading.value =true;
      String vehicleInteriorPathsUrl = await FirebaseUtils.uploadImage(
          vehicleInteriorPaths.value,
          "User/Host/${hostId}/addVehicle/${id}/vehicleInteriorPaths");


      await addVehicleRef.doc(id).update({"vehicleImageComplete":vehicleInteriorPathsUrl});
      await _updateCommonData(id).then((value) {
        showLoading.value =false;
        _response = "success";

      }).catchError((error){
        print(error.toString());
        showLoading.value = false;
      });
    }

   else if ( vehicleNumberPlatePath.value.isNotEmpty) {
     showLoading.value =true;
      String vehicleNumberPlatePathUrl = await FirebaseUtils.uploadImage(
          vehicleNumberPlatePath.value,
          "Host/addVehicle/${hostId}/${id}/image/vehicleNumberPlatePath");

      await addVehicleRef.doc(id).update({"vehicleImageComplete":vehicleNumberPlatePathUrl});
      await _updateCommonData(id).then((value) {
        showLoading.value =false;
        _response = "success";

      }).catchError((error){
        print(error.toString());
        showLoading.value = false;
      });
    }
    else if ( vehicleRegistrationProofPath.value.isNotEmpty) {
      showLoading.value = true;
      String vehicleRegistrationProofPathUrl = await FirebaseUtils.uploadImage(
          vehicleNumberPlatePath.value,
          "Host/addVehicle/${hostId}/${id}/image/vehicleNumberPlatePath");

      await addVehicleRef.doc(id).update({"vehicleImageComplete":vehicleRegistrationProofPathUrl});
      await _updateCommonData(id).then((value) {
        showLoading.value =false;
        _response = "success";

      }).catchError((error){
        print(error.toString());
        showLoading.value = false;
      });
    }

   else if ( vehicleRearPaths.value.isNotEmpty) {
      showLoading.value =true;
      String vehicleRearPathsUrl = await FirebaseUtils.uploadImage(
          vehicleNumberPlatePath.value,
          "Host/addVehicle/${hostId}/${id}/image/vehicleNumberPlatePath");

      await addVehicleRef.doc(id).update({"vehicleImageComplete":vehicleRearPathsUrl});
      await _updateCommonData(id).then((value){    showLoading.value =false;
      _response = "success";

      }).catchError((error){
        print(error.toString());
        showLoading.value = false;
      });
    }

  else  if ( imagesUrl.value != null && imagesUrl.value.isNotEmpty) {
      showLoading.value =true;
      imagesUrl.value = await FirebaseUtils.uploadMultipleImage(vehicleMore.value, "Host/addVehicle/${hostId}/${id}/image/imageList", extension: "png",);
      uploadedandimagesUrl.value = [
        ...uploadedimageUrl.value,
        ...imagesUrl.value,
      ];

      await addVehicleRef.doc(id).update({"imagesUrl":uploadedandimagesUrl.value});
      await _updateCommonData(id).then((value) {
        showLoading.value =false;
        _response = "success";

      }).catchError((error){
        print(error.toString());
        showLoading.value = false;
      });

    }
  else{
      showLoading.value =true;
      await _updateCommonData(id).then((value){

        showLoading.value =false;
        _response = "success";

      }).catchError((error){
        print(error.toString());
        showLoading.value = false;
      });
    }

    return _response;
  }
  Future<void> _updateCommonData(String id)async{
    await addVehicleRef.doc(id).update({
    "vehicleModel":vehicleModel.value.text.trim(),
    "address":address.value,
    "vehicleCategory":selectCategoryName.value,
    "vehicleYear":vehicleYear.value.text.trim(),
    "vehicleSeats":vehicleSeats.value.text.trim(),
    "vehicleTransmission":selectTransmission.value,
    "vehicleFuelType":selectFuelType.value,
    "vehicleNumberPlate":vehicleNumberPlate.value.text.trim(),
    "vehicleColor":vehicleColor.value.text.trim(),
    "vehicleLicenseExpiryDate":vehicleLicenseExpiryDate.value.text.trim(),
    "vehiclePerDayRent":vehiclePerDayRent.value.text.trim(),
    "vehiclePerHourRent":vehiclePerHourRent.value.text.trim(),
    "vehicleDescription":vehicleDescription.value.text.trim(),
    "latitude":latitude,
    "longitude":longitude,
    });
  }

}
