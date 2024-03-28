import 'package:careno/constant/colors.dart';
import 'package:careno/controllers/controller_edit_profile.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:careno/widgets/custom_edit_text_filed.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../AuthSection/screen_allow_location.dart';

class ScreenHostEditProfile extends StatelessWidget {
 String userType;
  @override
  Widget build(BuildContext context) {
    ControllerEditProfile controllerEditProfile = Get.put(
        ControllerEditProfile());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Edit Profile"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.appPrimaryColor),
                    image: DecorationImage(image: AssetImage(
                        "assets/images/user-image.png"
                    ),
                        fit: BoxFit.cover
                    )
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.appPrimaryColor
                    ),
                    child: CustomSvg(name: "camera",),
                  ),),
              ),
            ).marginSymmetric(vertical: 15.h),
            CustomEditTextField(
              labelText: "Full Name",
              hint: "Name",
              controller: TextEditingController(text: "Jenny Wilson"),
            ),
            CustomEditTextField(
              labelText: "Email",
              hint: "jenniferfowler78@gmail.com",
            ),
            Obx(() {
              return CustomEditTextField(
                labelText: "Date of Birth",
                padding: EdgeInsets.only(left: 18.w, top: 18.h),
                readOnly: true,
                hint: controllerEditProfile.dateTime.value==null?"Date of Birth" : "${controllerEditProfile.dateTime.value?.year}/${controllerEditProfile.dateTime.value?.month}/${controllerEditProfile.dateTime.value?.day}",
                hintColor:controllerEditProfile.dateTime.value==null?Color(0xff94979F).withOpacity(.7):Colors.black,
                controller: TextEditingController(text: "26 January, 2002"),
                suffix: IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/picker.svg", width: 30.w,),
                  onPressed: () {
                    controllerEditProfile.selectDate(context);
                  },).marginOnly(top: 4.h),
              );
            }),
            Obx(() {
              return CustomEditTextField(
                labelText: "Gender",
                padding: EdgeInsets.only(left: 18.w, top: 18.h),
                readOnly: true,
                hintColor: controllerEditProfile.selectedGender.value.isEmpty
                    ? Colors.black.withOpacity(.5)
                    : Colors.black,

                hint: controllerEditProfile.selectedGender.value.isEmpty
                    ? "Gender"
                    : controllerEditProfile.selectedGender.value,
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
                    controllerEditProfile.selectedGender.value = choice;
                  },
                ).marginOnly(top: 4.h),
              );
            }),
            if(userType=="host") CustomEditTextField(
              labelText: "Phone(Optional)",
              hint: "+1 847 5357 535",
              controller: TextEditingController(text: "+1 847 5357 535"),
            ),
            CustomEditTextField(
              labelText: "Address",
              controller: TextEditingController(text: "New York, NY 10036, United States"),
              padding: EdgeInsets.only(left: 18.w, top: 1.h),
              hint: "Address",
              suffix: InkWell(
                  onTap: (){
                    Get.to(ScreenAllowLocation());
                  },
                  child: SvgPicture.asset("assets/images/location.svg").marginOnly(top: 4.h)),
            ),
            CustomEditTextField(
              labelText: "Profile Description",
              hint: "Name",
              controller: TextEditingController(text: "Lorem Ipsuc is simply dummy text of the pr...."),
            ),
            CustomButton(title: "Update Changes", onPressed: (){}).marginSymmetric(vertical: 30.h)

          ],).marginSymmetric(horizontal: 24.w),
        ),
      ),
    );
  }

 ScreenHostEditProfile({
    required this.userType,
  });
}
