import 'dart:io';

import 'package:careno/constant/custom_textfiled.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/views/screens/screen_allow_location.dart';
import 'package:careno/views/screens/screen_location.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/custom_button.dart';
import '../../controllers/home_controller.dart';

class ScreenCompleteProfile extends StatefulWidget {
  const ScreenCompleteProfile({Key? key}) : super(key: key);

  @override
  State<ScreenCompleteProfile> createState() => _ScreenCompleteProfileState();
}

class _ScreenCompleteProfileState extends State<ScreenCompleteProfile> {
  HomeController controller = Get.put(HomeController());
  // DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let’s Complete Profile",
                style: TextStyle(
                  fontFamily: "UrbanistBold",
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
                              ? AssetImage("assets/images/profile.png") as ImageProvider// Default image
                              : FileImage(controller.images.value), // Image from File object
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
                style: TextStyle(fontFamily: "Urbanist", fontSize: 13.sp,color: Colors.black),)),
              Text("Add Details", style: TextStyle(fontFamily: "UrbanistBold",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700),).marginOnly(
                  top: 30.h,),

              Obx(() {
                return CustomTextField(
                  padding: EdgeInsets.only(left: 10.w, top: 18.h),
                  readOnly: true,
                  hint: controller.dateTime.value==null?"Date of Birth" : "${controller.dateTime.value?.year}/${controller.dateTime.value?.month}/${controller.dateTime.value?.day}",
                  hintColor:controller.dateTime.value==null?Color(0xff94979F).withOpacity(.7):Colors.black,

                  suffix: IconButton(
                    icon: SvgPicture.asset("assets/images/picker.svg",width: 30.w,),
                    onPressed: () {
                      controller.selectDate(context);

                    },).marginOnly(top: 4.h),
                );
              }).marginSymmetric(horizontal: 4.w,vertical: 8.h),

              Obx(() {
                return CustomTextField(
                  padding: EdgeInsets.only(left: 10.w, top: 18.h),
                  readOnly: true,
                  hint: controller.selectedGender.value.isEmpty ? "Gender" : controller.selectedGender.value,
                  hintColor:controller.selectedGender.value.isEmpty?Color(0xff94979F).withOpacity(.7):Colors.black,
                  suffix: PopupMenuButton(
                    icon: Icon(Icons.expand_more),
                    color: Theme.of(context).primaryColor,
                    itemBuilder: (BuildContext context) {
                      return ['Male', 'Female',].map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice,style: TextStyle(color: Colors.white,fontFamily: "Urbanist"),),
                        );
                      }).toList();
                    },
                    onSelected: (String choice) {
                      // Update selected gender when an option is chosen
                      controller.selectedGender.value = choice;
                    },
                  ).marginOnly(top: 4.h),
                );
              }).marginSymmetric(horizontal: 4.w, vertical: 8.h),
              Obx(() {
                return CustomTextField(
                  padding: EdgeInsets.only(left: 10.w, top: 18.h),
                  hint: "Phone(Optional)",
                  keyboardType: TextInputType.number,
                  hintColor:controller.countryCode.value==null?Color(0xff94979F).withOpacity(.7):Colors.black,
                  prefix: CountryCodePicker(
                  padding: EdgeInsets.zero,
                  onChanged: (value) {
                    controller.countryCode.value= value.dialCode.toString();
                  },
                  textStyle: TextStyle(fontSize: 16.sp,fontFamily: "UrbanistBold"),
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'US',
                  favorite: ['+1', 'US'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ).marginOnly(top: 4.h),
                );
              }).marginSymmetric(horizontal: 4.w,vertical: 8.h),
              Obx(() {
                return CustomTextField(
                  padding: EdgeInsets.only(left: 10.w, top: 1.h),
                  readOnly: true,
                  hint: "Address",
                  hintColor:controller.selectedGender.value.isEmpty?Color(0xff94979F).withOpacity(.7):Colors.black,
                  suffix: InkWell(
                    onTap: (){
                      Get.to(ScreenAllowLocation());
                    },
                      child: SvgPicture.asset("assets/images/location.svg").marginOnly(top: 4.h)),
                );
              }).marginSymmetric(horizontal: 4.w, vertical: 8.h),
            ],
          ),
        ),
      ),
    );
  }
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageT = File(image.path);
setState(() {
  this.controller.images.value = imageT;

});
  }


}
