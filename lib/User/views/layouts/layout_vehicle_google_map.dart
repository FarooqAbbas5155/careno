import 'dart:developer';

import 'package:careno/controllers/home_controller.dart';
import 'package:careno/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constant/colors.dart';
import '../../../constant/helpers.dart';
import '../../../widgets/custom_button.dart';
import '../screens/screen_car_details.dart';
import '../screens/screen_user_chat.dart';

class LayoutVehicleGoogleMap extends StatefulWidget {
  @override
  State<LayoutVehicleGoogleMap> createState() => _LayoutVehicleGoogleMapState();
}

class _LayoutVehicleGoogleMapState extends State<LayoutVehicleGoogleMap> {
  HomeController controller = Get.put(HomeController());
  late GoogleMapController _mapController;

  BitmapDescriptor? customIcon;

  @override
  void initState() {
    super.initState();
    setCustomIcon();
  }

  // Custom icon
  Future<void> setCustomIcon() async {
    final ByteData byteData = await rootBundle.load('assets/images/marker.png');
    final Uint8List markerIcon = byteData.buffer.asUint8List();
    final BitmapDescriptor bitmapDescriptor =
        BitmapDescriptor.fromBytes(markerIcon,size: Size(10, 10));
    setState(() {
      customIcon = bitmapDescriptor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(30.964750, 70.939934),
          zoom: 7.0,
        ),
        markers: createMarkers(),
      ),
    );
  }

  Set<Marker> createMarkers() {
    Set<Marker> markers = {};

    if (customIcon == null) {
      // Handle case where customIcon is not yet initialized
      return markers; // Return empty set
    }

    for (int i = 0; i < controller.addhostvehicle.value.length; i++) {
      var event = controller.addhostvehicle.value[i];
      log(event.toString());
      double lat = event.latitude;
      double lng = event.longitude;
      LatLng position = LatLng(lat, lng);

      markers.add(
        Marker(
          infoWindow: InfoWindow(
            title: event.vehicleModel,
            snippet: "Active",
          ),
          markerId: MarkerId('marker$i'),
          position: position,
          icon: customIcon!,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 220.h,
                  child: FutureBuilder(
                      future: getUser(event.hostId),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.appPrimaryColor,
                              ));
                        }
                        var user = snapshot.data!;
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100.h,
                                width: 83.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5.r),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          event.vehicleImageComplete
                                        ),
                                        fit: BoxFit.fill)),
                              ).marginOnly(left: 12.w, top: 20.h),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event.vehicleModel,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w700),
                                    ),
                                    FutureBuilder<Category?>(
                                        future: getCategory(event!.vehicleCategory),
                                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return Center(
                                                child: CircularProgressIndicator(
                                                  color: AppColors.appPrimaryColor,
                                                ));
                                          }
                                          Category category = snapshot.data!;
                                          return Text(
                                          category.name,
                                          style: TextStyle(
                                              color: Color(0xffAAAAAA),
                                              fontSize: 11.sp,
                                              fontFamily: "Urbanist",
                                              fontWeight: FontWeight.w500),
                                        ).marginOnly(bottom: 2.h);
                                      }
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0xffFBC017),
                                        ),
                                        Text(
                                          event.rating.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.sp,
                                              fontFamily: "Urbanist",
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "(0)",
                                          style: TextStyle(
                                              color: Color(0xffAAAAAA),
                                              fontSize: 11.sp,
                                              fontFamily: "Urbanist",
                                              fontWeight: FontWeight.w500),
                                        ).marginOnly(left: 4.w),
                                      ],
                                    ).marginOnly(bottom: 8.h),
                                    Text(
                                      event.address,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 11.sp,
                                        fontFamily: "Urbanist",
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ).marginOnly(left: 8.w, top: 22.h),
                              ),
                              Container(
                                height: 36.h,
                                width: 40.w,
                                margin: EdgeInsets.only(right: 12.w),
                                decoration: BoxDecoration(
                                    color: Color(0xffAAAAAA).withOpacity(.2),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Color(0xff949494),
                                ),
                              ).marginOnly(bottom: 40.h),
                            ],
                          ),
                          Center(
                            child: Row(
                              children: [
                                CustomButton(
                                  width: 180.w,
                                  title: 'View Details',
                                  onPressed: () {
                                    Get.back();
                                    Get.to(ScreenCarDetails(addHostVehicle: event,));

                                  },
                                ).marginOnly(left: 10.w),
                                CustomButton(
                                  width: 160.w,
                                  title: 'Message',
                                  onPressed: () {
                                    Get.back();
                                    Get.to(ScreenUserChat(user: user,));

                                  },
                                ).marginOnly(left: 10.w),
                              ],
                            ).marginOnly(top: 20.h),
                          )
                        ],
                      );
                    }
                  ),
                );
              },
            );
          },
        ),
      );
    }

    return markers;
  }
}
