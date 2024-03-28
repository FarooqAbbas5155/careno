import 'package:careno/User/views/layouts/item_layout_explore_popular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUserFavoriteVehicles extends StatelessWidget {
  const ScreenUserFavoriteVehicles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Favorite Vehicles"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 26.w,vertical: 10.h),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
        return ItemLayoutExplorePopular();
      },),
    ));
  }
}
