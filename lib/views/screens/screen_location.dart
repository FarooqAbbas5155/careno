import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constant/custom_button.dart';
import '../../constant/custom_textfiled.dart';
import '../../constant/helpers.dart';
import '../../constant/location_utils.dart';

class ScreenLocation extends StatefulWidget {
  @override
  State<ScreenLocation> createState() => _ScreenLocationState();
}

class _ScreenLocationState extends State<ScreenLocation> {
  Set<Marker> _markers = {};
  TextEditingController _searchController = TextEditingController();
  LatLng? _selectedLocation;

  GoogleMapController? _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _addCurrentLocationMarker();
  }

  void _addCurrentLocationMarker() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('current_position'),
          position: LatLng(position.latitude, position.longitude),
          draggable: true,
          onDragEnd: (newPosition) {
            _selectedLocation = newPosition;
          },
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _addCurrentLocationMarker();
  }

  void _searchLocation() async {
    String searchText = _searchController.text;
    List<Location> locations = await locationFromAddress(searchText);
    if (locations.isNotEmpty) {
      Location firstResult = locations.first;
      LatLng position = LatLng(firstResult.latitude, firstResult.longitude);
      setState(() {
        _markers.clear();
        _markers.add(
          Marker(
            markerId: MarkerId('selected_position'),
            position: position,
            draggable: true,
            onDragEnd: (newPosition) {
              _selectedLocation = newPosition;
            },
          ),
        );
        _selectedLocation = position;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<bool>(
          future: checkPermissionStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: primaryColor,
                  strokeWidth: 1,
                ),
              );
            }
            if (snapshot.data == false) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Location Access Is Not Granted",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "UrbanistBold",
                        fontSize: 18.sp,
                      ),
                    ).marginSymmetric(vertical: 20.h),
                    CustomButton(
                      width: 200.w,
                      title: 'Retry',
                      onPressed: () {
                        setState(() {});
                      },
                    )
                  ],
                ),
              );
            }
            return FutureBuilder<Position>(
              future: Geolocator.getCurrentPosition(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: primaryColor,
                      strokeWidth: 3,
                    ),
                  );
                }
                var position = snapshot.data!;

                return Stack(
                  children: [
                    GoogleMap(
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(position!.latitude, position.longitude),
                        zoom: 8.0,
                      ),
                      markers: _markers
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Positioned(
                          top: 10.h,
                          left: 10.w,
                          right: 10.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back, color: Colors.black),
                              ),
                              Text(
                                "            ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "UrbanistBold",
                                ),
                              ),
                              Text(
                                "Location Map",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "UrbanistBold",
                                ),
                              ),

                            ],
                          ),
                        ),
                        Positioned(
                          top: 10.h,
                          left: 10.w,
                          right: 10.w,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                               Container(
                                 width: 287.w,
                                 height: 48.h,
                                 padding: EdgeInsets.symmetric(horizontal: 18.w),
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(25.r),

                                 ),
                                 child: TextField(
                                   decoration: InputDecoration(
                                     hintText: "Search here.....",
                                     border: InputBorder.none
                                   ),
                                 ),
                               ),
                                Container(
                                  padding: EdgeInsets.all(6.sp),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle
                                  ),
                                  child: Icon(Icons.search,color: Colors.white,),
                                ).marginSymmetric(horizontal: 8.w)
                              ],
                            ),
                          )
                        ),

                      ],
                    ),
                    Positioned(
                        left: 22.w,
                        right: 22.w,
                        bottom: 20.h,
                        child: CustomButton(
                            title: "Save", onPressed: (){}))

                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
