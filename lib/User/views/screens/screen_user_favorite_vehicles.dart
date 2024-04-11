import 'package:careno/User/views/layouts/item_layout_explore_popular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/helpers.dart';
import '../../../models/add_host_vehicle.dart';

class ScreenUserFavoriteVehicles extends StatelessWidget {
  const ScreenUserFavoriteVehicles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Favorite Vehicles"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: addVehicleRef.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState==ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            var vehicle=snapshot.data!.docs.map((e) => AddHostVehicle.fromMap(e.data() as Map<String,dynamic>)).toList();

            return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 26.w,vertical: 10.h),
            itemCount: vehicle.length,
            itemBuilder: (BuildContext context, int index) {
            return ItemLayoutExplorePopular(addHostVehicle: vehicle[index],);
          },);
        }
      ),
    ));
  }
}
