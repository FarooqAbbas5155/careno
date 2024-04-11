import 'dart:developer';

import 'package:careno/User/views/screens/screen_filter.dart';
import 'package:careno/constant/colors.dart';
import 'package:careno/constant/helpers.dart';
import 'package:careno/widgets/custom_button.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';

class ScreenSearchFilter extends StatefulWidget {
  @override
  State<ScreenSearchFilter> createState() => _ScreenSearchFilterState();
}

class _ScreenSearchFilterState extends State<ScreenSearchFilter> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),

        ),
        child: SingleChildScrollView(
          child:Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Filter by",
                  style: TextStyle(
                    color: AppColors.appPrimaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "UrbanistBold",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Car Category/Type",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(children: [
                    Text(
                      controller.Cartype.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.expand_more),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      itemBuilder: (BuildContext context) {
                        return Cartype.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(
                              choice,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Urbanist"),
                            ),
                          );
                        }).toList();
                      },
                      onSelected: (String choice) {
                        // Update selected gender when an option is chosen
                        controller.Cartype.value = choice;
                        setState(() {

                        });
                      },
                    ),
                  ])
                ],
              ),
              Divider(
                height: 0,
                thickness: .5,
                color: Color(0xffD8D8D8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Model Year",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(children: [
                    Text(
                      controller.CarModel.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.expand_more),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      itemBuilder: (BuildContext context) {
                        return CarModel.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(
                              choice,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Urbanist"),
                            ),
                          );
                        }).toList();
                      },
                      onSelected: (String choice) {
                        // Update selected gender when an option is chosen
                        controller.CarModel.value = choice;
                        setState(() {

                        });
                      },
                    ),
                  ])
                ],
              ),
              Divider(
                height: 0,
                thickness: .5,
                color: Color(0xffD8D8D8),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transmission",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(children: [
                    Text(
                      controller.CarTransmission.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.expand_more),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      itemBuilder: (BuildContext context) {
                        return CarTransmission.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(
                              choice,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Urbanist"),
                            ),
                          );
                        }).toList();
                      },
                      onSelected: (String choice) {
                        // Update selected gender when an option is chosen
                        controller.CarTransmission.value = choice;
                        setState(() {

                        });
                      },
                    ),
                  ])
                ],
              ),
              Divider(
                height: 0,
                thickness: .5,
                color: Color(0xffD8D8D8),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fuel Type",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(children: [
                    Text(
                      controller.CarFuelType.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.expand_more),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      itemBuilder: (BuildContext context) {
                        return CarFuelType.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(
                              choice,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Urbanist"),
                            ),
                          );
                        }).toList();
                      },
                      onSelected: (String choice) {
                        // Update selected gender when an option is chosen
                        controller.CarFuelType.value = choice;
                        setState(() {

                        });
                      },
                    ),
                  ])
                ],
              ),
              Divider(
                height: 0,
                thickness: .5,
                color: Color(0xffD8D8D8),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Seats Capacity",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(children: [
                    Text(
                      controller.CarSeatsCapacity.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.expand_more),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      itemBuilder: (BuildContext context) {
                        return CarSeatsCapacity.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(
                              choice,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Urbanist"),
                            ),
                          );
                        }).toList();
                      },
                      onSelected: (String choice) {
                        // Update selected gender when an option is chosen
                        controller.CarSeatsCapacity.value = choice;
                        setState(() {

                        });
                      },
                    ),
                  ])
                ],
              ),
              Divider(
                height: 0,
                thickness: .5,
                color: Color(0xffD8D8D8),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Car Location",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(children: [
                    Text(
                      controller.CarLocation.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.expand_more),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      itemBuilder: (BuildContext context) {
                        return CarLocation.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(
                              choice,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Urbanist"),
                            ),
                          );
                        }).toList();
                      },
                      onSelected: (String choice) {
                        // Update selected gender when an option is chosen
                        controller.CarLocation.value = choice;
                        setState(() {

                        });
                      },
                    ),
                  ])
                ],
              ),
              Divider(
                height: 0,
                thickness: .5,
                color: Color(0xffD8D8D8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rating",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  RatingBar(
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 5,
                    maxRating: 5,
                    filledColor: primaryColor,
                    size: 24,
                  )
                ],
              ).marginSymmetric(vertical: 8.h),
              Divider(
                height: 0,
                thickness: .5,
                color: Color(0xffD8D8D8),
              ),
              Text(
                "Price Range",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "UrbanistBold",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: Get.width,
                child: Obx(() {
                  final startLabel = "${currencyUnit}${controller.selectedRange.value.start.toStringAsFixed(0)}";
                  final endLabel = "${currencyUnit}${controller.selectedRange.value.end.toStringAsFixed(0)}";

                  return SliderTheme(
                    data: SliderThemeData(
                      thumbShape: SliderComponentShape.noOverlay,
                      overlayColor: AppColors.appPrimaryColor,
                      valueIndicatorColor: Color(0xFF2F97D1),
                      // Change the overlay color
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white, // Change the label text color here
                      ),
                    ),
                    child: RangeSlider(
                      min: 0,
                      max: 100,
                      divisions: 99,
                      labels: RangeLabels(startLabel, endLabel),
                      values: controller.selectedRange.value,
                      onChanged: (value) {
                        controller.selectedRange.value = value;
                        log(controller.selectedRange.value.start.toString());
                        log(controller.selectedRange.value.end.toString());
                      },
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("${currencyUnit}0",style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600
                  ),),
                  Text("${currencyUnit}100",style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600
                  ),),
                ],
              ).marginSymmetric(horizontal: 25.w
              ),
              Image.asset("assets/images/Line 39.png").marginSymmetric(horizontal: 40.w,vertical: 20.h),
              Center(
                child: Text(
                  "Sort by",
                  style: TextStyle(
                    color: AppColors.appPrimaryColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600
                    ,fontFamily: "UrbanistBold",
                  ),
                ),
              ),
              RadioListTile(
                  title: Text("Popular Vehicle",
                    style: TextStyle(color: Colors.black,fontFamily: "UrbanistBold",fontSize: 15.sp,
                        fontWeight: FontWeight.w600),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: primaryColor,
                  value: "popularVehicle",
                  groupValue: controller.popularVehicle.value,
                  onChanged: (String? value) {
                    setState(() {
                      controller.popularVehicle.value = value!;

                    });
                  }),
              Divider(
                height: 0,
                thickness: .5,
                color: Color(0xffD8D8D8),
              ),
              RadioListTile(
                  title: Text("Price Low to Heigh",
                    style: TextStyle(color: Colors.black,fontFamily: "UrbanistBold",fontSize: 15.sp,
                        fontWeight: FontWeight.w600),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: primaryColor,
                  value: "pricelowtoheigh",
                  groupValue: controller.popularVehicle.value,
                  onChanged: (String? value) {
                    setState(() {
                      controller.popularVehicle.value = value!;

                    });
                  }),
              Divider(
                height: 0,
                thickness: .5,
                color: Color(0xffD8D8D8),
              ),
              RadioListTile(
                  title: Text("Price Heigh To Low",
                    style: TextStyle(color: Colors.black,fontFamily: "UrbanistBold",fontSize: 15.sp,
                        fontWeight: FontWeight.w600),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: primaryColor,
                  value: "priceheightolow",
                  groupValue: controller.popularVehicle.value,
                  onChanged: (String? value) {
                    setState(() {
                      controller.popularVehicle.value = value!;

                    });
                  }),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    CustomButton(
                        width: 164.w,
                        color: Color(0xffC7C7C7),
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp
                            ,color: Colors.black
                        ),
                        title: "Clear", onPressed: (){}),
                    CustomButton(
                        width: 164.w,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp
                            ,color: Colors.white
                        ),
                        title: "Apply", onPressed: (){
                      Get.to(ScreenFilter());
                    }),
                  ]
              )

            ],
          ).marginSymmetric(horizontal: 15.w,vertical: 15.h),

        ),
      ),
    );
  }
  var Cartype = ["Sedan","Trucks","Luxury Car","Electronic Car"];
  var CarBrand = ["Toyota","Jeep","Luxury Car","Ford Ranger"];
  var CarModel = ["2000","2019","2022","2025"];
  var CarTransmission  = ["Automatic","Compterized"];
  var CarFuelType      = ["Gasoline","Petrol","Diesel"];
  var CarSeatsCapacity = ["01","02","03","04"];
  var CarLocation       =     ["Central Park New York","Pakistan layyah","Krachi layyah"];
}
