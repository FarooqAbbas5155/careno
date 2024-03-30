import 'dart:io';

import 'package:careno/AuthSection/screen_allow_location.dart';
import 'package:careno/AuthSection/screen_location.dart';
import 'package:careno/widgets/custom_textfiled.dart';
import 'package:careno/constant/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../constant/location_utils.dart';
import '../controllers/phone_controller.dart';
import '../widgets/custom_button.dart';


class ScreenCompleteProfile extends StatefulWidget {
  const ScreenCompleteProfile({Key? key}) : super(key: key);

  @override
  State<ScreenCompleteProfile> createState() => _ScreenCompleteProfileState();
}

class _ScreenCompleteProfileState extends State<ScreenCompleteProfile> {
  PhoneController controller = Get.put(PhoneController());

  // DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let’s Complete Profile",
                  style: TextStyle(
                    fontFamily: "Urbanist",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Center(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(16.sp),
                          padding: EdgeInsets.symmetric(horizontal: 6.sp),
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: primaryColor, width: 1),
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            //   image: controller.images.value == null
                            //       ? AssetImage(
                            //       "assets/images/profile.png") as ImageProvider
                            //       : FileImage(
                            //       controller.images.value), // Replace with your image path
                            //   // fit: BoxFit.cover, // Adjust the image fit as needed
                            // ),
                          ),
                          child: CircleAvatar(
                            radius: 10.sp, // Adjust the radius as needed
                            backgroundImage: controller.images.value == null
                                ? AssetImage(
                                "assets/images/profile.png") as ImageProvider // Default image
                                : FileImage(controller.images
                                .value), // Image from File object
                          ),
                        ),
                        Positioned(
                          bottom: 16.w,
                          left: 68.sp,
                          right: 0.w,
                          child: GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle
                                ),
                                child: Icon(Icons.add, color: Colors.white,)),
                          ),
                        )
                      ],
                    )
                ),
                Center(child: Text("Add Profile Image",
                  style: TextStyle(fontFamily: "Urbanist",
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),)),
                Text("Add Details", style: TextStyle(fontFamily: "Urbanist",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700),).marginOnly(
                  top: 15.h,),
                CustomTextField(
                  controller: controller.fullName.value,
                  padding: EdgeInsets.only(left: 18.w, top: 1.h),
                  hint: "Enter Full Name",
                  hintColor: controller.fullName.value == null ? Color(
                      0xff94979F).withOpacity(.7) : Colors.black,
                ).marginSymmetric(horizontal: 12.w, vertical: 8.h),
                CustomTextField(
                  controller: controller.email.value,
                  padding: EdgeInsets.only(left: 18.w, top: 1.h),
                  hint: "Enter Email",
                  hintColor: controller.email.value == null ? Color(0xff94979F)
                      .withOpacity(.7) : Colors.black,
                ).marginSymmetric(horizontal: 12.w, vertical: 8.h),
                Obx(() {
                  return CustomTextField(
                    padding: EdgeInsets.only(left: 18.w, top: 18.h),
                    readOnly: true,
                    hint: controller.Dob.value == null
                        ? "Date of Birth"
                        : "${controller.Dob.value?.year}/${controller
                        .Dob.value?.month}/${controller.Dob.value
                        ?.day}",
                    hintColor: controller.Dob.value == null ? Color(
                        0xff94979F).withOpacity(.7) : Colors.black,

                    suffix: IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/picker.svg", width: 30.w,),
                      onPressed: () {
                        controller.selectDate(context);
                      },).marginOnly(top: 4.h),
                  );
                }).marginSymmetric(horizontal: 12.w, vertical: 8.h),

                Obx(() {
                  return CustomTextField(
                    padding: EdgeInsets.only(left: 18.w, top: 18.h),
                    readOnly: true,
                    hintColor: controller.selectedGender.value.isEmpty ? Color(
                        0xff94979F).withOpacity(.7) : Colors.black,

                    hint: controller.selectedGender.value.isEmpty
                        ? "Gender"
                        : controller.selectedGender.value,
                    suffix: PopupMenuButton(
                      icon: Icon(Icons.expand_more),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      itemBuilder: (BuildContext context) {
                        return ['Male', 'Female',].map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice, style: TextStyle(
                                color: Colors.white, fontFamily: "Urbanist"),),
                          );
                        }).toList();
                      },
                      onSelected: (String choice) {
                        // Update selected gender when an option is chosen
                        controller.selectedGender.value = choice;
                      },
                    ).marginOnly(top: 4.h),
                  );
                }).marginSymmetric(horizontal: 12.w, vertical: 8.h),
                // Obx(() {
                //   return CustomTextField(
                //     padding: EdgeInsets.only(left: 18.w, top: 18.h),
                //     hint: "Phone(Optional)",
                //     keyboardType: TextInputType.number,
                //     hintColor:controller.countryCode.value==null?Color(0xff94979F).withOpacity(.7):Colors.black,
                //     prefix: CountryCodePicker(
                //     padding: EdgeInsets.zero,
                //     onChanged: (value) {
                //       controller.countryCode.value= value.dialCode.toString();
                //     },
                //     textStyle: TextStyle(fontSize: 16.sp,fontFamily: "UrbanistBold"),
                //     // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                //     initialSelection: 'US',
                //     favorite: ['+1', 'US'],
                //     // optional. Shows only country name and flag
                //     showCountryOnly: false,
                //     // optional. Shows only country name and flag when popup is closed.
                //     showOnlyCountryWhenClosed: false,
                //     // optional. aligns the flag and the Text left
                //     alignLeft: false,
                //   ).marginOnly(top: 4.h),
                //   );
                // }).marginSymmetric(horizontal: 12.w,vertical: 10.h),
              FutureBuilder<String?>(
                future: getAddressFromLatLng(
                    controller.latitude, controller.longitude),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While the future is loading, return a placeholder or loading indicator
                    return CircularProgressIndicator(); // Example loading indicator
                  } else if (snapshot.hasError) {
                    // If there's an error, handle it accordingly
                    return CustomTextField(
                      padding: EdgeInsets.only(left: 18.w, top: 1.h),
                      hint: 'Select Address again',
                      // Use the address from the snapshot
                      hintColor: Color(0xff94979F).withOpacity(.7),
                      suffix: InkWell(
                        onTap: () {
                          if (controller.permissionStatus.value == true) Get.to(
                              ScreenLocation());
                          if (controller.permissionStatus.value == false) Get.to(
                              ScreenAllowLocation());
                        },
                        child: SvgPicture.asset(
                            "assets/images/location.svg").marginOnly(
                            top: 4.h),
                      ),
                    );
                  } else {
                    // If the future has completed successfully, display the address
                    return CustomTextField(
                      padding: EdgeInsets.only(left: 18.w, top: 1.h),
                      hint: snapshot.data ?? '',
                      // Use the address from the snapshot
                      hintColor: Colors.black,
                      suffix: InkWell(
                        onTap: () {
                          Get.to(ScreenAllowLocation());
                          if (controller.permissionStatus.value == true) Get.to(
                              ScreenLocation());
                          if (controller.permissionStatus.value == false) Get.to(
                              ScreenAllowLocation());
                        },
                        child: SvgPicture.asset(
                            "assets/images/location.svg").marginOnly(
                            top: 4.h),
                      ),
                    );
                  }
                },
              ).marginSymmetric(horizontal: 12.w, vertical: 8.h),
                CustomTextField(
                  controller: controller.profileDescription.value,
                  padding: EdgeInsets.only(left: 18.w),
                  hint:"Profile Description",
                  hintColor: controller.profileDescription.value == null
                      ? Color(0xff94979F).withOpacity(.7)
                      : Colors.black,

                ).marginSymmetric(horizontal: 12.w, vertical: 8.h),
                Center(
                  child: CustomButton(
                      width: 310.w,
                      title: "Save", onPressed: ()async {
                  await  controller.UpdateProfileData();

                    // if (controller.userType.value == "user") {
                    //   controller.UpdateProfileData();
                    //   Get.to(ScreenUserHome());
                    // }
                    // else {
                    //   Get.to(ScreenHostAddIdentIdentityProof());
                    // }
                  }).marginOnly(top: 8.h),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      print("Image selection cancelled.");
      return;
    }

    final imageFile = File(image.path);
    if (!imageFile.existsSync()) {
      print("Image file does not exist at path: ${imageFile.path}");
      return;
    }

    try {
      setState(() {
        this.controller.images.value = imageFile;
        print("Image Path: ${controller.images.value}");
      });
    } catch (error) {
      print("Error setting image: $error");
    }
  }


}
