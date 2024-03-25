
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../layouts/item_layout_explore_popular.dart';

class ScreenPreviewCategory extends StatelessWidget {
  const ScreenPreviewCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          }, icon: Icon(Icons.arrow_back,color: Colors.black),),
        title: Text("Luxary Cars ",style: TextStyle(color: Colors.black,fontSize:24.sp ,fontWeight:FontWeight.w700 ,fontFamily: "UrbanistBold"),),
        centerTitle: true,
        actions: [
          Icon(Icons.search,color: Colors.black,).marginOnly(right: 20.w)
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
        return ItemLayoutExplorePopular().marginSymmetric(horizontal: 10.w);
      },),
    );
  }
}
