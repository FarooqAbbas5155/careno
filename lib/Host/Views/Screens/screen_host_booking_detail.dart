import 'package:careno/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';

class ScreenHostBookingDetail extends StatelessWidget {
  String status;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2.0,
          title: Text(
            "Booking Detail",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildBookedServiceContainer(),
              buildVehicleContainer(),
              buildSummaryContainer()
            ],
          ),
        ),
      ),
    );
  }

  Container buildSummaryContainer() {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.12),
                offset: Offset(2, 2),
                blurStyle: BlurStyle.outer,
                blurRadius: 15.r,
                spreadRadius: 2.r),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Booking Summary",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Start Date ",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF484848).withOpacity(.7)),
              ),
              Text(
                "14 March, 2024",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF263238)),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "End Date ",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF484848).withOpacity(.7)),
              ),
              Text(
                "14 March, 2024",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF263238)),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pick-up Time ",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF484848).withOpacity(.7)),
              ),
              Text(
                "10:00 AM",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF263238)),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Drop-off Time",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF484848).withOpacity(.7)),
              ),
              Text(
                "04:00 PM",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF263238)),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          Divider(
            color: Colors.black.withOpacity(.1),
          ),
          Text(
            "Booking Summary",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF484848).withOpacity(.7)),
              ),
              Text(
                "200\$",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF263238)),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Service Fee",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF484848).withOpacity(.7)),
              ),
              Text(
                "15\$",
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF263238)),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          Divider(
            height: 10.h,
            color: Colors.black.withOpacity(.1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF484848).withOpacity(.7)),
              ),
              Text(
                "215\$",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appPrimaryColor),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          if(status=="Pending")buildPendingButton(),
          if(status=="In progress")buildInprogressButton(),
          if(status=="Completed"||status=="Canceled")buildCompletedButton(),
          if (status=="Completed") buildReview(),
          if (status=="Canceled") buildCanceledReason(),
        ],
      ),
    );
  }

  Widget buildPendingButton() {
    return Column(
      children: [
        Row(children: [
              Expanded(
                child: CustomButton(title: "Decline", onPressed: (){},
                  textStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700
                  ),
                color: Color(0xFFFF2021),

                ),
              ),
              SizedBox(width: 15.w
                ,),
              Expanded(
                child: CustomButton(title: "Accept", onPressed: (){},
                color: Color(0xFF0F9D58),
                  textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700
                  ),
                ),
              )
            ],).marginSymmetric(vertical: 15.h),
        Align(
          alignment: Alignment.center,
          child: CustomButton(
              width: 217.w
              ,
              textStyle: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700
              ),
              title: "Message", onPressed: (){}),
        )
      ],
    );
  }

  Container buildVehicleContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.12),
                offset: Offset(2, 2),
                blurStyle: BlurStyle.outer,
                blurRadius: 15.r,
                spreadRadius: 2.r),
          ]),
      child: ExpansionTile(
        textColor: Colors.black,
        iconColor: Colors.black,

        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),

        // expandedAlignment: Alignment.centerLeft,
        maintainState: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        title: Text(
          "Vehicle Details",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
        ),
        children: [
          SizedBox(
            height: 72.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: Get.height,
                  width: 73.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      image: DecorationImage(
                          image: AssetImage("assets/images/vechilce-image.png"),
                          fit: BoxFit.fill)),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Toyota Camry",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14.sp),
                            ),
                            Text(
                              "322 Hoffman Dr, Cherry Hill, NJ 08077, New York",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  color: AppColors.appPrimaryColor,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  fontSize: 11.sp),
                            ),
                          ],
                        ).marginOnly(left: 8.w, right: 15.w),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ).marginSymmetric(vertical: 4.h),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: RichText(
                    text: TextSpan(
                        text: "Year: ",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF616161)),
                        children: [
                      TextSpan(
                          text: "2020",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xFF828282)))
                    ])),
              ),
              Expanded(
                flex: 2,
                child: RichText(
                    text: TextSpan(
                        text: "Type: ",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF616161)),
                        children: [
                      TextSpan(
                          text: "Sedan",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xFF828282)))
                    ])),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: RichText(
                    text: TextSpan(
                        text: "Color: ",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF616161)),
                        children: [
                      TextSpan(
                          text: "Black",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xFF828282)))
                    ])),
              ),
              Expanded(
                flex: 2,
                child: RichText(
                    text: TextSpan(
                        text: "Seats: ",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF616161)),
                        children: [
                      TextSpan(
                          text: "04",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xFF828282)))
                    ])),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: RichText(
                    text: TextSpan(
                        text: "Transmission: ",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF616161)),
                        children: [
                      TextSpan(
                          text: "Automatic",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xFF828282)))
                    ])),
              ),
              Expanded(
                flex: 2,
                child: RichText(
                    text: TextSpan(
                        text: "Fuel Type: ",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF616161)),
                        children: [
                      TextSpan(
                          text: "Gasoline",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xFF828282)))
                    ])),
              ),
            ],
          ).marginSymmetric(vertical: 4.h),
          Text(
            "Description",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ).marginSymmetric(vertical: 4.h),
          Text(
            "The Toyota Camry is a stylish and reliable sedan that offers a comfortable and enjoyable driving experience. With its sleek design and advanced features, the Camry is perfect for both city commuting and long road trips.",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11.sp,
                color: Color(0xFf828282)),
          ).marginSymmetric(vertical: 4.h),
        ],
      ),
    );
  }

  Container buildBookedServiceContainer() {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.12),
                offset: Offset(2, 2),
                blurStyle: BlurStyle.outer,
                blurRadius: 15.r,
                spreadRadius: 2.r),
          ]),
      child: SizedBox(
        height: 72.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: Get.height,
              width: 73.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  image: DecorationImage(
                      image: AssetImage("assets/images/user-image.png"),
                      fit: BoxFit.fill)),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kristin Watson",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14.sp),
                        ),
                        Text(
                          "322 Hoffman Dr, Cherry Hill, NJ 08077, New York",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              color: AppColors.appPrimaryColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              fontSize: 11.sp),
                        ),
                      ],
                    ).marginOnly(left: 8.w, right: 15.w),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        color: status == "Pending"
                            ? Color(0xFFFB9701)
                            : status == "In progress"
                                ? Color(0xFF00A651)
                                : status == "Completed"
                                    ? Color(0xFF0F9D58)
                                    : Color(0xFFFF2021),
                        fontSize: 12.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ScreenHostBookingDetail({
    required this.status,
  });

  buildInprogressButton() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            title: "Cancel Booking", textStyle:TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),

            color: AppColors.appPrimaryColor,
            onPressed: () {},
          ),
        ),
        SizedBox(width: 10.w,),
        Expanded(
          child: CustomButton(
            title: "Message",
            textStyle: TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white
    ),
            color: AppColors.appPrimaryColor,
            onPressed: () {},
          ),
        ),
      ],
    ).marginSymmetric(vertical: 15.h);
  }

  buildCompletedButton() {
    return CustomButton(title: "Message", onPressed: (){}, textStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white
    ),).marginSymmetric(vertical: 15.h);
  }

  buildReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.black.withOpacity(.1), thickness: .5,),
        Text("Customer Review",style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18.sp
        ),),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/user-image.png"),
          ),
          title: Text("Kristin Watson",style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1B1B1B)
          ),),
          subtitle: Text("21 June, 2021",style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 8.sp,
            color: Color(0xFF999999)
          ),),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.star, color: Color(0xFFFBC017),),
              Text("4.5", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13.sp
              ),)
            ],
          ),
        ),
        Text('Review text popular belief, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsu...',style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF414141)
        ),)

    ],).marginSymmetric(vertical: 10.h);
  }

  buildCanceledReason() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [        Divider(color: Colors.black.withOpacity(.1), thickness: .5,),


        Text("Cancel Reason",style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp
        ),),
        Text("Customer has canceled the Booking.",style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xFFFF2021),
            fontSize: 12.sp
        ),).marginSymmetric(vertical: 5.h),Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor turpis quis ex eleifend, eget tempor diam ultricies. Nullam eu velit nec justo vestibulum aliquam. Duis auctor diam eu elit consequat, vel dapibus purus consequat.',style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF414141)
        ),)

      ],
    );
  }
}
