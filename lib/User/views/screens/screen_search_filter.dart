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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Filter Results",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              fontFamily: "UrbanistBold",
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child:Column(
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
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(children: [
                    Text(
                      controller.Cartype.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
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
                indent: 1,
                endIndent: 1,
                color: Color(0xffEDEEEE),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Model Year",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(children: [
                    Text(
                      controller.CarModel.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
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
                indent: 1,
                endIndent: 1,
                color: Color(0xffEDEEEE),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transmission",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(children: [
                    Text(
                      controller.CarTransmission.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
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
                indent: 1,
                endIndent: 1,
                color: Color(0xffEDEEEE),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fuel Type",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(children: [
                    Text(
                      controller.CarFuelType.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
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
                indent: 1,
                endIndent: 1,
                color: Color(0xffEDEEEE),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Seats Capacity",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(children: [
                    Text(
                      controller.CarSeatsCapacity.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
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
                indent: 1,
                endIndent: 1,
                color: Color(0xffEDEEEE),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Car Location",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(children: [
                    Text(
                      controller.CarLocation.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Urbanist",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
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
                indent: 1,
                endIndent: 1,
                color: Color(0xffEDEEEE),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rating",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
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
              ),
              Divider(
                indent: 1,
                endIndent: 1,
                color: Color(0xffEDEEEE),

              ),
              Text(
                "Price Range",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "UrbanistBold",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),
              ),
              Image.asset("assets/images/Line 39.png").marginSymmetric(horizontal: 20.w,vertical: 20.h),
              Center(
                child: Text(
                  "Sort by",
                  style: TextStyle(
                    color: AppColors.appPrimaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "UrbanistBold",
                  ),
                ),
              ),
              RadioListTile(
                  title: Text("Popular Vehicle",
                    style: TextStyle(color: Colors.black,fontFamily: "UrbanistBold",fontWeight: FontWeight.w700,fontSize: 18.sp),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: primaryColor,
                  value: "popularVehicle",
                  groupValue: controller.popularVehicle.value,
                  onChanged: (String? value) {
                    setState(() {
                      controller.popularVehicle.value = value!;

                    });
                  }),
              RadioListTile(
                  title: Text("Price Low to Heigh",
                    style: TextStyle(color: Colors.black,fontFamily: "UrbanistBold",fontWeight: FontWeight.w700,fontSize: 18.sp),),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: primaryColor,
                  value: "pricelowtoheigh",
                  groupValue: controller.popularVehicle.value,
                  onChanged: (String? value) {
                    setState(() {
                      controller.popularVehicle.value = value!;

                    });
                  }),
              RadioListTile(
                  title: Text("Price Heigh To Low",
                    style: TextStyle(color: Colors.black,fontFamily: "UrbanistBold",fontWeight: FontWeight.w700,fontSize: 18.sp),),
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
                      title: "Clear", onPressed: (){}),
                  CustomButton(
                      width: 164.w,

                      title: "Apply", onPressed: (){
                        Get.to(ScreenFilter());
                  }),
                ]
              )

            ],
          ).marginSymmetric(horizontal: 12.w,vertical: 15.h),
        )
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
