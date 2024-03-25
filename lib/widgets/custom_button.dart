import 'package:careno/constant/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? textColor;
  final Border? border;

  CustomButton({
    required this.title,
    this.color,
    required this.onPressed,
    this.width,
    this.height,
    this.textStyle,
    this.textColor,
    this.border
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?? 331.w,
      height: height??50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color?? primaryColor,
          foregroundColor: Colors.grey,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            title ?? 'Button',
            style: textStyle ?? TextStyle(fontSize: 18.sp,fontFamily: "UrbanistBold", fontWeight: FontWeight.w700,color: textColor??Colors.white),
          ),
        ),
      ),
    );
  }
}
