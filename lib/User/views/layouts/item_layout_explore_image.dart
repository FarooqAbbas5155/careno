import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ItemLayoutExploreImage extends StatelessWidget {
  const ItemLayoutExploreImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      child: Column(
        children: [
          Container(
            height: 50.h,
            width: 100.w,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              // radius: 35.r,
              backgroundImage: AssetImage("assets/images/explore_car.png"),
            ),
          ),
          Center(
            child: AutoSizeText(
              "Luxury car",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Urbanist",
                  fontSize: 13.sp,
                  overflow: TextOverflow.ellipsis
              ),
            ),
          )
        ],
      ),
    );
  }
}
