import 'package:card_swiper/card_swiper.dart';
import 'package:careno/models/add_host_vehicle.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScreenHostVehicleMyDetail extends StatelessWidget {
 AddHostVehicle addHostVehicle;
 String categoryName;


  @override
  Widget build(BuildContext context) {
    List<String> imagesList=[
      addHostVehicle.vehicleImageComplete,
      addHostVehicle.vehicleImageInterior,
      addHostVehicle.vehicleImageRear,
      addHostVehicle.vehicleImageRightSide,
      addHostVehicle.vehicleImageNumberPlate,
      ...addHostVehicle.imagesUrl
    ];

    print("addHostVehicle.imagesUrl ${addHostVehicle.imagesUrl.length}");
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
                      color: addHostVehicle.status == "Pending"
                          ? Color(0xFFFB9701)
                          : addHostVehicle.status == "In progress"
                              ? Color(0xFF3C79E6)
                              : addHostVehicle.status == "Completed"
                                  ? Color(0xFF0F9D58)
                                  : Color(0xFFFF2021),
                      shape: BoxShape.circle),
                ),
                Text(
                  addHostVehicle.status,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: addHostVehicle.status == "Pending"
                          ? Color(0xFFFB9701)
                          : addHostVehicle.status == "In progress"
                              ? Color(0xFF3C79E6)
                              : addHostVehicle.status == "Completed"
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
                                  image: NetworkImage(
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

              buildDetail("Make & Model of Vehicle", addHostVehicle.vehicleModel),
              buildDetail("Category/Type", categoryName!),
              buildDetail("Year of Vehicle", addHostVehicle.vehicleYear),
              buildDetail("Number of Seats", addHostVehicle.vehicleSeats),
              buildDetail("Transmission", addHostVehicle.vehicleTransmission),
              buildDetail("Fuel Type", addHostVehicle.vehicleFuelType),
              buildDetail("Vehicle Plate Number", addHostVehicle.vehicleNumberPlate),
              buildDetail("Vehicle License Expiry Date", addHostVehicle.vehicleLicenseExpiryDate),
              buildDetail("Per Day Rent", "\$ ${addHostVehicle.vehiclePerDayRent}"),
              buildDetail("Per Hours Rent", "\$ ${addHostVehicle.vehiclePerHourRent}"),
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
                        image: NetworkImage(addHostVehicle.vehicleRegistrationImage),
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
    required this.addHostVehicle,
    required this.categoryName,
  });
}
