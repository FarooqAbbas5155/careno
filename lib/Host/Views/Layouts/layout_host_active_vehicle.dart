import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/helpers.dart';
import '../../../models/add_host_vehicle.dart';
import 'item_host_vehicle.dart';

class LayoutHostActiveVehicle extends StatelessWidget {
  const LayoutHostActiveVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: addVehicleRef.where("status",isEqualTo: "Active").snapshots(), builder: (BuildContext context,  snapshot) {
      if (snapshot.connectionState==ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator.adaptive(),);
      }
      var vehicleList = snapshot.data!.docs.map((e) => AddHostVehicle.fromMap(e.data() as Map<String, dynamic>)).toList();
      return vehicleList.isEmpty?Center(child: Text("No Active Vehicle ",style: TextStyle(color: Colors.black),)):ListView.builder(itemCount: vehicleList.length, itemBuilder: (context, index) {
        return ItemHostVehicle( addHostVehicle: vehicleList[index],);

      });
    },);
  }
}
