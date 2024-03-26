import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'item_host_vehicle.dart';

class LayoutHostActiveVehicle extends StatelessWidget {
  const LayoutHostActiveVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 10.h,),
        ItemHostVehicle(status: 'Active',),
        ItemHostVehicle(status: 'Active',),
        ItemHostVehicle(status: 'Active',),
        ItemHostVehicle(status: 'Active',),
        ItemHostVehicle(status: 'Active',),
        ItemHostVehicle(status: 'Active',),
        ItemHostVehicle(status: 'Active',),
      ],),
    );
  }
}
