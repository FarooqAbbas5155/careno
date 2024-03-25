import 'package:careno/constant/colors.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/bubble_special_three.dart';

class ScreenUserChat extends StatelessWidget {
  const ScreenUserChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 3,
        leadingWidth: 75.w,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 10.w,),
              CustomSvg(name: "arrow",),

              CircleAvatar(
                radius: 20.r,
                backgroundImage: AssetImage("assets/images/user-image.png"),
              ),

            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Kristin Watson",style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp
            ),),
            Text("Last Seen 12:18  AM",style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(.4)
            ),),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon:CustomSvg(name: "more",),
            color: Colors.white,
            itemBuilder: (BuildContext context) {
              return ['Block User', 'Clear Chat',].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice,style: TextStyle(color: Color(0xFF272727),fontFamily: "Urbanist",fontSize: 11.sp,fontWeight: FontWeight.w600),),
                );
              }).toList();
            },
            onSelected: (String choice) {

            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                BubbleSpecialThree(
                  text: 'Added iMessage shape bubbles',
                  tail: true,
                  seen: true,
                  sent: true,
                time: '10:15  AM',
                ),
                BubbleSpecialThree(
                  text: 'Please try and give some feedback on it!',
                  tail: true,
                  seen: true,

                  time: '10:15  AM',
                ),
                BubbleSpecialThree(
                  text: 'Sure',
                  tail: true,
                  isSender: false, time: '10:15  AM',
                ),
                BubbleSpecialThree(
                  text: "I tried. It's awesome!!!",
                  tail: true,
                  isSender: false, time: '10:15  AM',
                ),
                BubbleSpecialThree(
                  text: "Thanks",
                  tail: true,
                  isSender: false, time: '10:15  AM',
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: SizedBox(
                height: 48.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Write something...",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xFFC6C4CC)
                    ),
                    border: InputBorder.none,
                    fillColor: Color(0xFFF2F2F2),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),

                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              )),
              Container(
                height: 48.h,
                  margin: EdgeInsets.only(left: 10.w
                  ),
                  width: 48.w,
                  // padding: EdgeInsets.all(10.r),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.appPrimaryColor,
                    borderRadius: BorderRadius.circular(8.r)
                  ),
                  child: CustomSvg(name: "ic_Send",)),
            ],
          ).marginOnly(bottom: 16.h,left: 16.w,right: 16.w),
        ],
      ),
    ));
  }
}
