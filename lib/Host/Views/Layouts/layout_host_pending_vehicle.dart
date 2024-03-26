import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'item_host_vehicle.dart';

class LayoutHostPendingVehicle extends StatelessWidget {
  const LayoutHostPendingVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 10.h,),

        ItemHostVehicle(status: 'Pending',),
        ItemHostVehicle(status: 'Pending',),
        ItemHostVehicle(status: 'Pending',),
        ItemHostVehicle(status: 'Pending',),
        ItemHostVehicle(status: 'Pending',),
        ItemHostVehicle(status: 'Pending',),
        ItemHostVehicle(status: 'Pending',),
      ],),
    );
  }
}
