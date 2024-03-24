import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';


import '../../../widgets/custom_button.dart';
import '../../../constant/helpers.dart';
import '../screens/screen_car_details.dart';

class LayoutVehicleGoogleMap extends StatefulWidget {
  @override
  State<LayoutVehicleGoogleMap> createState() => _LayoutVehicleGoogleMapState();
}

class _LayoutVehicleGoogleMapState extends State<LayoutVehicleGoogleMap> {
  late GoogleMapController _mapController;

  BitmapDescriptor? customIcon;

  List<farooq> events = [
    farooq(name: 'Host 1', lat: 30.964750, lng: 70.939934),
    farooq(name: "Host 2", lat: 30.970655, lng: 71.212303),
    farooq(name: "Host 3", lat: 30.987242, lng: 72.227242),
    farooq(name: "Host 4", lat: 30.924710, lng: 73.939904),
    farooq(name: "Host 5", lat: 30.904790, lng: 74.939924),
    farooq(name: "Host 6", lat: 30.964700, lng: 75.989904),
  ];

  @override
  void initState() {
    super.initState();
    setCustomIcon();
  }

  // Custom icon
  Future<void> setCustomIcon() async {
    final ByteData byteData = await rootBundle.load('assets/images/marker.png');
    final Uint8List markerIcon = byteData.buffer.asUint8List();
    final ImageConfiguration imageConfiguration = ImageConfiguration(size: Size(48, 48)); // Set desired width and height
    final BitmapDescriptor bitmapDescriptor = BitmapDescriptor.fromBytes(
      markerIcon,
         );
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
          target: LatLng(30.964750,  70.939934),
          zoom: 6.0,
        ),
        markers: customIcon != null ? createMarkers() : {},
      ),
    );
  }

  Set<Marker> createMarkers() {
    Set<Marker> markers = {};

    for (int i = 0; i < events.length; i++) {
      farooq event = events[i];
      double lat = event.lat; // Latitude of the event
      double lng = event.lng; // Longitude of the event

      LatLng position = LatLng(lat, lng);

      markers.add(
        Marker(
          infoWindow: InfoWindow(
            title: event.name,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 110.h,
                                    width: 88.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.r),
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/car2.png"),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  ).marginOnly(left: 12.w,top: 20.h),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Tesla Model 3",style: TextStyle(color: Colors.black,fontSize: 20.sp,fontFamily:"UrbanistBold" ,fontWeight: FontWeight.w700),),
                                      Text("Electric Car",style: TextStyle(color: Color(0xffAAAAAA),fontSize: 15.sp,fontFamily:"Urbanist" ,fontWeight: FontWeight.w600),).marginOnly(bottom: 2.h),
                                      Row(
                                        children: [
                                          Icon(Icons.star,color: Color(0xffFBC017),),
                                          Text("5.0",style: TextStyle(color: Colors.black,fontSize: 16.sp,fontFamily:"UrbanistBold" ,fontWeight: FontWeight.w700),),
                                          Text("(528)",style: TextStyle(color: Color(0xffAAAAAA),fontSize: 11.sp,fontFamily:"Urbanist" ,fontWeight: FontWeight.w600),).marginOnly(left: 4.w),
                                        ],
                                      ).marginOnly(bottom: 8.h),
                                      Text(
                                        "2775 S Book Drive, Denver, Co 80222\nUniversity New York",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 11.sp,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),


                                    ],
                                  ).marginOnly(left: 8.w,top: 22.h),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 36.h,
                            width: 40.w,
                            margin: EdgeInsets.only(right: 12.w),
                            decoration: BoxDecoration(
                                color: Color(0xffAAAAAA).withOpacity(.2),
                                shape: BoxShape.circle
                            ),
                            child: Icon(Icons.favorite_border,color: Color(0xff949494),),
                          ).marginOnly(bottom: 40.h),

                        ],
                      ),
                      Center(
                        child: Row(
                          children: [
                            CustomButton(
                              width: 180.w,
                              title: 'View Details', onPressed: () {
                                Get.to(ScreenCarDetails());
                            },).marginOnly(left: 10.w),
                            CustomButton(
                              width: 160.w,
                              title: 'Message', onPressed: () {  },).marginOnly(left: 10.w),
                          ],
                        ).marginOnly(top: 20.h),
                      )
                    ],
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

class farooq {
  String name;
  double lat;
  double lng;

  farooq({
    required this.name,
    required this.lat,
    required this.lng,
  });
}
