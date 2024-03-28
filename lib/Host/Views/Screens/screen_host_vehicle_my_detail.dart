import 'package:card_swiper/card_swiper.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenHostVehicleMyDetail extends StatelessWidget {
  String status;
  List<String> imagesList=[
    "assets/images/image.png",
    "assets/images/image1.png",
    "assets/images/image2.png",
    "assets/images/image3.png",
    "assets/images/image4.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Vehicle Details"),
          actions: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 8.h,
                  width: 8.h,
                  decoration: BoxDecoration(
                      color: status == "Pending"
                          ? Color(0xFFFB9701)
                          : status == "In progress"
                              ? Color(0xFF3C79E6)
                              : status == "Completed"
                                  ? Color(0xFF0F9D58)
                                  : Color(0xFFFF2021),
                      shape: BoxShape.circle),
                ),
                Text(
                  status,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: status == "Pending"
                          ? Color(0xFFFB9701)
                          : status == "In progress"
                              ? Color(0xFF3C79E6)
                              : status == "Completed"
                                  ? Color(0xFF0F9D58)
                                  : Color(0xFFFF2021),
                      fontSize: 12.sp),
                ).marginOnly(bottom: 4.h, top: 4.h),
              ],
            ).marginSymmetric(horizontal: 15.w)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                  child: Swiper(
                    outer: false,
                    itemBuilder: (c, i) {
                      return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      imagesList[i]),
                                  fit: BoxFit.cover)),
                        child: Container(
                          height: 145.h,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.black.withOpacity(.0),
                                Colors.black
                              ]
                                ,
                                begin: Alignment.topCenter,
                                end: FractionalOffset.bottomCenter,
                              )
                          ),),

                      );
                    },
                    pagination: SwiperPagination(
                        margin: EdgeInsets.symmetric(vertical: 15.h)),
                    itemCount: imagesList.length,
                  ),
                  constraints:
                  BoxConstraints.loose(Size(Get.width, 231.0.h))),

              buildDetail("Make & Model of Vehicle", "Toyota Camry"),
              buildDetail("Category/Type", "Sedan"),
              buildDetail("Year of Vehicle", "2024"),
              buildDetail("Number of Seats", "4"),
              buildDetail("Transmission", "Automatic"),
              buildDetail("Fuel Type", "Gasoline"),
              buildDetail("Vehicle Plate Number", "10-SY-118"),
              buildDetail("Vehicle License Expiry Date", "02 April, 2030"),
              buildDetail("Per Day Rent", "\$ 150"),
              buildDetail("Per Hours Rent", "\$ 15"),
              Text(
                "Vehicle Registration",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ).marginSymmetric(horizontal: 14.w),
              Container(
                height: 162.h,
                margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 46.w),
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF979797)),
                    borderRadius: BorderRadius.circular(6.r),
                    image: DecorationImage(
                        image: AssetImage("assets/images/registration.png"),
                        fit: BoxFit.cover)),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: CustomButton(title: "Edit Vehicle",
                  textStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),onPressed: (){})),
                  SizedBox(width: 10.w
                    ,),
                  Expanded(
                      child: CustomButton(title: "Delete Vehicle",

                  textStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),onPressed: (){},
                      color: Color(0xFFFE0000),
                      )),
                ],
              ).marginSymmetric(horizontal: 28.w
              ,vertical: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetail(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: Color(0xFF6A6A6A)),
        ).marginSymmetric(vertical: 2.h),
        Text(
          subtitle,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
              color: Colors.black),
        ).marginSymmetric(vertical: 2.h),
        Divider(
          color: Colors.black.withOpacity(.1),
        )
      ],
    ).marginSymmetric(vertical: 6.h, horizontal: 14.w);
  }

  ScreenHostVehicleMyDetail({
    required this.status,
  });
}
