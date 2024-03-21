import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';

import 'helpers.dart';

Widget Button(String title,VoidCallback onpress){
  return SizedBox(
    width:  331.w,
    height: 56.h,
    child: ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
          side: BorderSide(width: 1,color: primaryColor),
          backgroundColor:  Colors.white,
          foregroundColor: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Register',
          style:  TextStyle(fontSize: 18.sp,fontFamily: "UrbanistBold", fontWeight: FontWeight.bold,color: primaryColor),
        ),
      ),
    ),
  );
}