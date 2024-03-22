import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constant/helpers.dart';
import '../../constant/location_utils.dart';

class ScreenLocation extends StatefulWidget {
  @override
  State<ScreenLocation> createState() => _ScreenLocationState();
}

class _ScreenLocationState extends State<ScreenLocation> {
  Set<Marker> _markers = {};

  GoogleMapController? _mapController;

  var selectedCategory = "";

  void _onMapeCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:FutureBuilder<bool>(
          future:checkPermissionStatus(),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator.adaptive(
                backgroundColor: primaryColor,
                strokeWidth: 1,
              ));
            }
            if (snapshot.data?? false) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Location Access Is Not Granted"),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text("Retry"))
                  ],
                ),
              );

            }
            return FutureBuilder<Position>(
              future: Geolocator.getCurrentPosition(),
              builder:(context,snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(
                    backgroundColor: primaryColor,
                    strokeWidth: 1,
                  ));
                }
                var position = snapshot.data!;
                return  GoogleMap(
                    onMapCreated: _onMapeCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 15,
                    ));
              } ,
            );
          },
        )
      ),
    );
  }
}
