import 'dart:io';

import 'package:careno/Host/Views/Screens/screen_host_home_page.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/controllers/controller_host_add_vechicle.dart';
import 'package:careno/models/categories.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:careno/widgets/custom_image.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:careno/widgets/custom_textfiled.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constant/colors.dart';
import '../../../constant/file_pick.dart';
import '../../../constant/firebase_utils.dart';

class ScreenHostAddVehicle extends StatelessWidget {
  const ScreenHostAddVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerHostAddVechicle controllerHostAddIdentityProof =
    Get.put(ControllerHostAddVechicle());
    print(controllerHostAddIdentityProof.showLoading.value);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.clear),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Now Add Your Vehicle",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.sp),
              ),
              Wrap(
                spacing: 20.w,
                runSpacing: 20.h,
                children: [
                  Obx(() {
                    return addVehicle(() async {
                      controllerHostAddIdentityProof.vehiclePath.value =
                      await FilePick().pickImage(ImageSource.gallery);
                    }, "Vehicle Image must be visible in image",
                        RxString((controllerHostAddIdentityProof.vehiclePath
                            .value)));
                  }),
                  Obx(() {
                    return addVehicle(() async {
                      controllerHostAddIdentityProof.vehicleNumberPlatePath.value =
                      await FilePick().pickImage(ImageSource.gallery);
                    }, "Car plate number must visible in image",
                        RxString((controllerHostAddIdentityProof.vehicleNumberPlatePath
                            .value)));
                  }),
                  Obx(() {
                    return addVehicle(() async {
                      controllerHostAddIdentityProof.vehicleRightSidePaths.value =
                      await FilePick().pickImage(ImageSource.gallery);
                    }, "Capture vehicle's right side in the image",
                        RxString((controllerHostAddIdentityProof.vehicleRightSidePaths
                            .value)));
                  }),
                  Obx(() {
                    return addVehicle(() async {
                      controllerHostAddIdentityProof.vehicleRearPaths.value =
                      await FilePick().pickImage(ImageSource.gallery);
                    }, "Include the rear, with the rear plate",
                        RxString((controllerHostAddIdentityProof.vehicleRearPaths
                            .value)));
                  }),
                  Obx(() {
                    return addVehicle(() async {
                      controllerHostAddIdentityProof.vehicleInteriorPaths.value =
                      await FilePick().pickImage(ImageSource.gallery);
                    }, "Provide car interior picture",
                        RxString((controllerHostAddIdentityProof.vehicleInteriorPaths
                            .value)));
                  }),

                ],
              ),
              // buildVehicleContainer(controllerHostAddIdentityProof)
              //     .marginSymmetric(horizontal: 40.w, vertical: 20.h),
              Text(
                "Add Details",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
              ).marginSymmetric(vertical: 10.h),
              CustomTextField(
                controller: controllerHostAddIdentityProof.vehicleModel.value,
                hint: "Select Make & Model of Vehicle",
              ).marginSymmetric(vertical: 8.h),
              buildCategoryContainer(controllerHostAddIdentityProof, context)
                  .marginSymmetric(vertical: 10.h),
              CustomTextField(
                controller: controllerHostAddIdentityProof.vehicleYear.value,
                hint: "Enter Year of Vehicle",
                keyboardType: TextInputType.number,
              ).marginSymmetric(vertical: 8.h),
              CustomTextField(
                controller: controllerHostAddIdentityProof.vehicleSeats.value,
                hint: "Number of Seats",
                keyboardType: TextInputType.number,
              ).marginSymmetric(vertical: 8.h),
              buildTransmissionContainer(
                  controllerHostAddIdentityProof, context)
                  .marginSymmetric(vertical: 10.h),
              buildFuelContainer(controllerHostAddIdentityProof, context),
              CustomTextField(
                controller: controllerHostAddIdentityProof.vehicleNumberPlate.value,
                hint: "Vehicle Plate Number",
                keyboardType: TextInputType.number,
              ).marginSymmetric(vertical: 8.h),
              CustomTextField(
                controller: controllerHostAddIdentityProof.vehicleColor.value,
                hint: "Enter Vehicle Color",
                keyboardType: TextInputType.name,
              ).marginSymmetric(vertical: 8.h),
              CustomTextField(
                controller: controllerHostAddIdentityProof.vehicleLicenseExpiryDate.value,
                hint: "Vehicle License Expiry Date",
                keyboardType: TextInputType.datetime,
              ).marginSymmetric(vertical: 8.h),
              CustomTextField(
                controller: controllerHostAddIdentityProof.vehiclePerDayRent.value,
                hint: "Per Day Rent \$",
                keyboardType: TextInputType.number,
              ).marginSymmetric(vertical: 8.h),
              CustomTextField(
                controller: controllerHostAddIdentityProof.vehiclePerHourRent.value,
                hint: "Per Hours Rent \$",
                keyboardType: TextInputType.number,
              ).marginSymmetric(vertical: 8.h),
              // buildVehicleNumberPlate(controllerHostAddIdentityProof),
              buildRegistrationProof(controllerHostAddIdentityProof),
             controllerHostAddIdentityProof.showLoading.value == false? CustomButton(
                  title: 'Next',
                  onPressed: () async{
                    print(controllerHostAddIdentityProof.showLoading.value);
                    controllerHostAddIdentityProof.submitForm();
                  await  controllerHostAddIdentityProof.hostAddVehicle();
                  }).marginSymmetric(vertical: 20.h):Center(
                    child: SizedBox(
                                   height: 30.h,
                                     width: 30.w,
                                     child: CircularProgressIndicator(backgroundColor: AppColors.appPrimaryColor,color: Colors.white,)),
                  )
            ],
          ).marginSymmetric(horizontal: 22.w),
        ),
      ),
    );
  }

  Obx buildRegistrationProof(
      ControllerHostAddVechicle controllerHostAddIdentityProof) {
    return Obx(() {
      return GestureDetector(
        onTap: () async {
          controllerHostAddIdentityProof.vehicleRegistrationProofPath.value =
          await FilePick().pickImage(ImageSource.gallery);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Color(0xFFA6A6A6), width: 2.r),
          ),
          child: (controllerHostAddIdentityProof
              .vehicleRegistrationProofPath.value.isNotEmpty)
              ? Image.file(File(controllerHostAddIdentityProof
              .vehicleRegistrationProofPath.value))
              : Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomSvg(
                    name: "car-insurance",
                  ),
                  Text(
                    "Add vehicle\nregistration\nImage",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Obx buildVehicleNumberPlate(
      ControllerHostAddVechicle controllerHostAddIdentityProof) {
    return Obx(() {
      return GestureDetector(
        onTap: () async {
          controllerHostAddIdentityProof.vehicleNumberPlatePath.value =
          await FilePick().pickImage(ImageSource.gallery);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 15.h),
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Color(0xFFA6A6A6),
            border: Border.all(color: Color(0xFFA6A6A6), width: 2.r),
          ),
          child: (controllerHostAddIdentityProof
              .vehicleNumberPlatePath.isNotEmpty)
              ? Image.file(File(
              controllerHostAddIdentityProof.vehicleNumberPlatePath.value))
              : Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomSvg(
                        name: "vechilcle-number",
                      ),
                      Text(
                        "Take vehicle\nimage",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomSvg(
                    name: "info",
                  ).marginOnly(right: 3.w),
                  Text(
                    "Car plate number must visible in image",
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "Nunito"),
                  )
                ],
              ).marginSymmetric(vertical: 5.h)
            ],
          ),
        ),
      );
    });
  }
  // Stream<Category> fetchCategories() {
  //   return categoryRef.snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) => doc.).toList();
  //   });
  // }
  Widget buildCategoryContainer(
      ControllerHostAddVechicle controllerHostAddIdentityProof,
      BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
      return StreamBuilder<QuerySnapshot>(
        stream: categoryRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text("No Category Added"); // Loading indicator while fetching data
          }

          var categories = snapshot.data!.docs.map((e) => Category.fromMap(e.data() as Map<String, dynamic>)).toList();
          var categoryNameList = categories.map((e) => e.name).toList();

          return CustomTextField(
            padding: EdgeInsets.only(left: 18.w, top: 18.h),
            readOnly: true,
            hint: controllerHostAddIdentityProof.selectCategory.value.isEmpty ? "Select Category/Type" : controllerHostAddIdentityProof.selectCategory.value,
            hintColor: controllerHostAddIdentityProof.selectCategory.value.isEmpty ? Color(0xff94979F) : Colors.black,
            suffix: PopupMenuButton<String>(
              icon: Icon(Icons.expand_more),
              color: Theme.of(context).primaryColor,
              itemBuilder: (BuildContext context) {
                return categoryNameList.map((choice) {
                  return PopupMenuItem<String>(
                    value: choice.toString(),
                    child: Text(
                      choice,
                      style: TextStyle(color: Colors.white, fontFamily: "Urbanist"),
                    ),
                  );
                }).toList();
              },
              onSelected: (String choice) {
                // Update selected category when an option is chosen
                setState((){
                  controllerHostAddIdentityProof.selectCategory.value = choice.toString();

                });
              },
            ).marginOnly(top: 4.h),
          );
        },
      );
    },
    );
  }


  Obx buildTransmissionContainer(
      ControllerHostAddVechicle controllerHostAddIdentityProof,
      BuildContext context) {
    return Obx(() {
      return CustomTextField(
        padding: EdgeInsets.only(left: 18.w, top: 18.h),
        readOnly: true,
        hint: controllerHostAddIdentityProof.selectTransmission.value.isEmpty
            ? "Select Transmission"
            : controllerHostAddIdentityProof.selectTransmission.value,
        hintColor:
        controllerHostAddIdentityProof.selectTransmission.value.isEmpty
            ? Color(0xff94979F)
            : Colors.black,
        suffix: PopupMenuButton(
          icon: Icon(Icons.expand_more),
          color: Theme
              .of(context)
              .primaryColor,
          itemBuilder: (BuildContext context) {
            return [
              'Automatic',
              'Switch',
            ].map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(
                  choice,
                  style: TextStyle(color: Colors.white, fontFamily: "Urbanist"),
                ),
              );
            }).toList();
          },
          onSelected: (String choice) {
            // Update selected gender when an option is chosen
            controllerHostAddIdentityProof.selectTransmission.value = choice;
          },
        ).marginOnly(top: 4.h),
      );
    });
  }

  Widget addVehicle(VoidCallback onTap, String text, RxString imagePath) {
    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.only(r.h),
          height: 89.h,
          width: 92.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Color(0xFFC4C4C4).withOpacity(.3),
          ),
          child: (imagePath.value.isNotEmpty)
              ? Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r
              ),
              image: DecorationImage(
                image: FileImage(File(imagePath.value)),
                fit: BoxFit.fill,
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: CustomSvg(
                name: "edit-car",
              ).marginOnly(top: 10.h, right: 10.w),
            ),
          )
              : Column(
            children: [
              Spacer(),
              CustomSvg(
                name: "camer-",
              ),
              Spacer(),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 6.sp,
                  fontFamily: "Nunito",
                  color: Colors.black.withOpacity(.5),
                ),
              ).marginSymmetric(horizontal: 5.w, vertical: 8.h),
            ],
          ),
        ),
      );
    });
  }

  Obx buildFuelContainer(
      ControllerHostAddVechicle controllerHostAddIdentityProof,
      BuildContext context) {
    return Obx(() {
      return CustomTextField(
        padding: EdgeInsets.only(left: 18.w, top: 18.h),
        readOnly: true,
        hint: controllerHostAddIdentityProof.selectFuelType.value.isEmpty
            ? "Select Fuel Type"
            : controllerHostAddIdentityProof.selectFuelType.value,
        hintColor: controllerHostAddIdentityProof.selectFuelType.value.isEmpty
            ? Color(0xff94979F)
            : Colors.black,
        suffix: PopupMenuButton(
          icon: Icon(Icons.expand_more),
          color: Theme
              .of(context)
              .primaryColor,
          itemBuilder: (BuildContext context) {
            return [
              'Gasoline',
              'Patrol',
            ].map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(
                  choice,
                  style: TextStyle(color: Colors.white, fontFamily: "Urbanist"),
                ),
              );
            }).toList();
          },
          onSelected: (String choice) {
            // Update selected gender when an option is chosen
            controllerHostAddIdentityProof.selectFuelType.value = choice;
          },
        ).marginOnly(top: 4.h),
      );
    });
  }

  Obx buildVehicleContainer(
      ControllerHostAddVechicle controllerHostAddIdentityProof) {
    return Obx(() {
      return GestureDetector(
        onTap: () async {
          controllerHostAddIdentityProof.vehiclePath.value =
          await FilePick().pickImage(ImageSource.gallery);
        },
        child: SizedBox(
          height: 135.h,
          child: Stack(
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.black,
                dashPattern: [6, 6, 6, 6],
                strokeWidth: .5.sp,
                radius: Radius.circular(12),
                // padding: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 123.w,
                    width: Get.width,
                    child: controllerHostAddIdentityProof
                        .vehiclePath.value.isEmpty
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomImage(
                          name: "add-vehicle",
                        ),
                        Text(
                          "Click for add",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.appPrimaryColor),
                        )
                      ],
                    )
                        : Image.file(File(
                        controllerHostAddIdentityProof.vehiclePath.value)),
                  ),
                ),
              ).marginSymmetric(horizontal: 18.w),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    height: 38.h,
                    width: 38.w,
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.appPrimaryColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 14,
                        ))),
              )
            ],
          ),
        ),
      );
    });
  }
}
