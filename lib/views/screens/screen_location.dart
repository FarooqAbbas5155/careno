// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../../constant/helpers.dart';
// import '../../constant/location_utils.dart';
//
// class ScreenLocation extends StatelessWidget {
//   Set<Marker> _markers = {};
//   GoogleMapController? _mapController;
//
//   var selectedCategory = "";
//
//   void _onMapeCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }
//   @override
//
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body:FutureBuilder<bool>(
//           future:checkPermissionStatus(),
//           builder: (context,snapshot){
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator.adaptive(
//                 backgroundColor: primaryColor,
//                 strokeWidth: 1,
//               ));
//             }
//             if (snapshot.data?? false) {
//
//
//             }
//           },
//         )
//       ),
//     );
//   }
// }
