import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:careno/User/views/screens/screen_booking.dart';
import 'package:careno/User/views/screens/screen_booking_review.dart';
import 'package:careno/User/views/screens/screen_user_chat.dart';
import 'package:careno/controllers/controller_review.dart';
import 'package:careno/controllers/home_controller.dart';
import 'package:careno/models/add_host_vehicle.dart';
import 'package:careno/models/booking.dart';
import 'package:careno/models/rating.dart';
import 'package:careno/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/colors.dart';
import '../../../constant/fcm.dart';
import '../../../constant/firebase_utils.dart';
import '../../../constant/helpers.dart';
import '../../../controllers/payment_controller_2nd.dart';
import '../../../models/categories.dart';
import '../../../models/notification_model.dart';
import '../../../widgets/custom_button.dart';
import '../layouts/item_screen_car_details.dart';

class ScreenBookingDetails extends StatelessWidget {
  Booking booking;
  User host;
  AddHostVehicle vehicle;

  RxBool loading = false.obs;

  @override
  Widget build(BuildContext context) {
    ControllerReview controllerReview = Get.put(ControllerReview());
    var category = getCategory(vehicle.vehicleCategory);
    log(category.toString());
    List<String> imagesList = [
      vehicle.vehicleImageComplete,
      vehicle.vehicleImageRightSide,
      vehicle.vehicleImageRear,
      vehicle.vehicleImageNumberPlate,
      vehicle.vehicleImageInterior,
      ...vehicle.imagesUrl
    ];
    var percentageValue = booking.price / 100 * 15;
    var totalRent = percentageValue + booking.price;
    return SafeArea(
        child: Scaffold(
          body: FutureBuilder<DocumentSnapshot>(
              future: categoryRef.doc(vehicle.vehicleCategory).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var category =
                Category.fromMap(snapshot.data!.data() as Map<String, dynamic>);
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ConstrainedBox(
                              child: Swiper(
                                outer: false,
                                itemBuilder: (c, i) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(imagesList[i]),
                                            fit: BoxFit.cover)),
                                    child: Container(
                                      height: 145.h,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black.withOpacity(.0),
                                              Colors.black
                                            ],
                                            begin: Alignment.topCenter,
                                            end: FractionalOffset.bottomCenter,
                                          )),
                                    ),
                                  );
                                },
                                pagination: SwiperPagination(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15.h)),
                                itemCount: imagesList.length,
                              ),
                              constraints:
                              BoxConstraints.loose(Size(Get.width, 231.0.h))),
                          Positioned(
                            left: 10.w,
                            top: 20.h,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 29.h,
                                width: 29.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Icon(
                                  Icons.navigate_before_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10.h,
                            left: 10.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 35.w),
                                  padding: EdgeInsets.all(2.r),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2, color: Colors.white)),
                                  child: CircleAvatar(
                                    radius: 35.r,
                                    backgroundImage: NetworkImage(
                                        host.imageUrl),
                                  ),
                                ),
                                Text(
                                  host.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Urbanist",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24.sp),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFBC017),
                                    ),
                                    Text(
                                      "${vehicle.rating}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontFamily: "UrbanistBold",
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "(${Get.find<HomeController>().getReviewCount(Get.find<HomeController>().ratedVehicleList.value, vehicle.vehicleId).toString()})" ,
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.8),
                                          fontSize: 11.sp,
                                          fontFamily: "Urbanist",
                                          fontWeight: FontWeight.w600),
                                    ).marginOnly(left: 4.w),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.only(bottom: 12.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // Shadow color
                              spreadRadius: 1,
                              // Spread radius
                              blurRadius: 3,
                              // Blur radius
                              offset: Offset(0, 3), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  vehicle.vehicleModel,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "UrbanistBold"),
                                ).marginOnly(bottom: 4.h, top: 4.h),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 4.w),
                                      height: 8.h,
                                      width: 8.h,
                                      decoration: BoxDecoration(
                                          color: booking.bookingStatus ==
                                              "Request Pending"
                                              ? Color(0xFFFB9701)
                                              : booking.bookingStatus ==
                                              "Payment Pending"
                                              ? Color(0xFF1A9667)
                                              : booking.bookingStatus ==
                                              "In progress"
                                              ? Color(0xFF3C79E6)
                                              : booking.bookingStatus ==
                                              "Completed"
                                              ? Color(0xFF0F9D58)
                                              : Color(0xFFFF2021),
                                          shape: BoxShape.circle),
                                    ),
                                    Text(
                                      booking.bookingStatus,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                          color: booking.bookingStatus ==
                                              "Request Pending"
                                              ? Color(0xFFFB9701)
                                              : booking.bookingStatus ==
                                              "Payment Pending"
                                              ? Color(0xFF1A9667)
                                              : booking.bookingStatus ==
                                              "In progress"
                                              ? Color(0xFF3C79E6)
                                              : booking.bookingStatus ==
                                              "Completed"
                                              ? Color(0xFF0F9D58)
                                              : Color(0xFFFF2021),
                                          fontSize: 12.sp),
                                    ).marginOnly(bottom: 4.h, top: 4.h),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Location: ",
                                  style: TextStyle(
                                      color: Color(0xff616161),
                                      fontFamily: "UrbanistBold",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.sp),
                                ),
                                Expanded(
                                  child: Text(
                                    vehicle.address,
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: "Urbanist",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ).marginOnly(bottom: 8.h),
                            TextWidget(
                                "Year", vehicle.vehicleYear, "Type",
                                category.name),
                            TextWidget("Color", vehicle.vehicleColor, "Seats",
                                vehicle.vehicleSeats),
                            TextWidget(
                                "Transmission", vehicle.vehicleTransmission,
                                "Fuel Type", vehicle.vehicleFuelType),
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "UrbanistBold"),
                            ).marginOnly(bottom: 4.h, top: 4.h),
                            Text(
                              vehicle.vehicleDescription,
                              style: TextStyle(
                                  color: Color(0xff616161).withOpacity(.8),
                                  fontFamily: "Urbanist",
                                  fontSize: 13.sp),
                            ),
                          ],
                        ).marginSymmetric(horizontal: 10.w),
                      ).marginOnly(
                          left: 10.w, right: 10.w, top: 8.h, bottom: 12.h),
                      Container(
                        width: Get.width,
                        padding: EdgeInsets.only(bottom: 12.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // Shadow color
                              spreadRadius: 1,
                              // Spread radius
                              blurRadius: 3,
                              // Blur radius
                              offset: Offset(0, 3), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Booking Summary",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "UrbanistBold",
                                ),
                              ),
                            ),
                            BookingSummary(
                                "Start Date",
                                dateFormat(DateTime.fromMillisecondsSinceEpoch(
                                    booking.bookingStartDate))),
                            BookingSummary(
                                "End Date",
                                dateFormat(DateTime.fromMillisecondsSinceEpoch(
                                    booking.bookingEndDate))),
                            BookingSummary(
                                "Pick-up Time", formatTime(booking.startTime)),
                            BookingSummary(
                                "Drop-off Time", formatTime(booking.EndTime)),
                            Divider(
                              indent: 1,
                              endIndent: 1,
                              color: Color(0xffEDEEEE),

                              // color: AppColors.dividerColor,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                "Price Summary",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "UrbanistBold",
                                ),
                              ),
                            ),
                            BookingSummary(
                                "Subtotal", "${currencyUnit}${booking.price}"),
                            BookingSummary(
                                "Service Fee",
                                "${currencyUnit}${percentageValue}"),
                            Divider(
                              indent: 1,
                              endIndent: 1,
                              color: Color(0xffEDEEEE),

                              // color: AppColors.dividerColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    color: Color(0xff484848),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "${currencyUnit}${totalRent}",
                                  style: TextStyle(
                                      color: AppColors.appPrimaryColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "UrbanistBold"),
                                ),
                              ],
                            ).marginSymmetric(horizontal: 12.w, vertical: 4.h),
                            if (booking.bookingStatus == "Request Pending")
                              Center(
                                  child: CustomButton(
                                      title: "Message",
                                      onPressed: () {
                                        Get.to(ScreenUserChat(
                                          user: host,
                                        ));
                                      })).marginOnly(top: 14.h),
                            if (booking.bookingStatus == "Payment Pending")
                              Center(child: Obx(() {
                                return CustomButton(
                                    title: "Pay Now",
                                    isLoading: loading.value,
                                    onPressed: () async {
                                      loading.value = true;
                                      await PaymentsController2().makePayment(
                                          totalRent.round().toString(),
                                          booking.bookingId,
                                          onSuccess: (infoData) async {
                                            print(infoData);
                                            await bookingsRef.doc(booking.bookingId).update(
                                                {
                                                  "bookingStatus": "In progress"
                                                }).catchError((error){
                                                  log(error.toString());
                                                 loading.value=false;
                                            });
                                            var user =
                                                Get
                                                    .find<HomeController>()
                                                    .user
                                                    .value;
                                            log(user!.notificationToken);
                                            await FCM.sendMessageSingle(
                                              "Payment Paid",
                                              "${user!
                                                  .name} has Send you Payment for Booking",
                                              host.notificationToken,
                                              {},
                                            );

                                            var notification = NotificationModel(
                                              id: FirebaseUtils.newId
                                                  .toString(),
                                              title:
                                              "${user
                                                  .name} has Send you Payment for Booking",
                                              read: false,
                                              data: {
                                                "bookingId": booking.bookingId,
                                                "vehicleId": vehicle.vehicleId
                                              },
                                              timestamp: FirebaseUtils.newId,
                                              senderId: FirebaseUtils.myId,
                                              receiverId: vehicle.hostId,
                                              type: 'Booking Payment',
                                              subtitle: '',
                                            );
                                            await notificationRef
                                                .doc(notification.id)
                                                .set(notification.toMap());
                                            loading.value = false;
                                            Get.back();

                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment Successfully Send")));

                                          }, onError: (error) {
                                        loading.value = false;

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                            SnackBar(content: Text(error)));
                                      }).catchError((error) {
                                        loading.value = false;
                                        print(error.toString());
                                      });

                                      // Get.to(ScreenUserChat(
                                      //   user: host,
                                    });
                              })).marginOnly(top: 14.h),
                            if (booking.bookingStatus == "In progress")
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  // Button(
                                  //   () {
                                  //     showDialog(
                                  //       context: context,
                                  //       builder: (BuildContext context) {
                                  //         return AlertDialog(
                                  //           shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(14.r),
                                  //           ),
                                  //           backgroundColor: Colors.white,
                                  //           title: Center(
                                  //             child: Text(
                                  //               'Cancel Booking',
                                  //               style: TextStyle(
                                  //                 color: primaryColor,
                                  //                 fontSize: 20.sp,
                                  //                 fontWeight: FontWeight.w700,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           contentPadding: EdgeInsets.symmetric(
                                  //               vertical: 20.h),
                                  //           // Decrease height here
                                  //           content: Column(
                                  //             mainAxisSize: MainAxisSize.min,
                                  //             children: [
                                  //               TextField(
                                  //                 maxLines: 8,
                                  //                 decoration: InputDecoration(
                                  //                   border: OutlineInputBorder(
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(
                                  //                             12.0),
                                  //                     borderSide: const BorderSide(
                                  //                       width: 1,
                                  //                       style: BorderStyle.none,
                                  //                     ),
                                  //                   ),
                                  //                   filled: true,
                                  //                   hintStyle: TextStyle(
                                  //                       color: Color(0xFF7D7D7D),
                                  //                       fontSize: 12.sp,
                                  //                       fontWeight:
                                  //                           FontWeight.w500),
                                  //                   hintText:
                                  //                       "Explain Cancel Reason",
                                  //                   contentPadding: EdgeInsets.only(
                                  //                       left: 12,
                                  //                       top: 10.h,
                                  //                       bottom: 5),
                                  //                   fillColor: Colors.white,
                                  //                 ),
                                  //               ).paddingSymmetric(
                                  //                   horizontal: 20.w),
                                  //               SizedBox(height: 20.h),
                                  //               CustomButton(
                                  //                       title: 'Submit',
                                  //                       onPressed: () {
                                  //                         Get.back();
                                  //                       })
                                  //                   .paddingSymmetric(
                                  //                       horizontal: 20.w),
                                  //             ],
                                  //           ),
                                  //         );
                                  //       },
                                  //     );
                                  //   },
                                  //   "Cancel Booking",
                                  //   primaryColor,
                                  // ),
                                  Expanded(
                                    child: Button(() {
                                      Get.to(ScreenUserChat());
                                    }, "Message", primaryColor),
                                  ),
                                ],
                              ).marginOnly(top: 14.h, left: 12.w, right: 12.w),
                            if (booking.bookingStatus == "Completed" )
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  (booking.isRated==false)? Button(
                                        () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white,
                                            title: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Please Rate your experience with this Vehicle',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight
                                                          .w700,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Icon(Icons.close),
                                                ),
                                              ],
                                            ),
                                            contentPadding: EdgeInsets
                                                .symmetric(
                                                vertical: 20.h),
                                            content: StatefulBuilder(
                                              builder: (BuildContext context,
                                                  StateSetter setState) {
                                                return Column(
                                                  mainAxisSize: MainAxisSize
                                                      .min,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Obx(() {
                                                        return Text(
                                                          controllerReview
                                                              .type.value,
                                                          style: TextStyle(
                                                            color: primaryColor,
                                                            fontSize: 22.sp,
                                                            fontWeight:
                                                            FontWeight.w700,
                                                          ),
                                                        );
                                                      }),
                                                    ).marginOnly(bottom: 10.h),
                                                    Container(
                                                      alignment: Alignment
                                                          .center,
                                                      margin: EdgeInsets
                                                          .symmetric(
                                                          horizontal: 50.w),
                                                      child: RatingBar(
                                                        isHalfAllowed: false,
                                                        filledIcon: Icons.star,
                                                        filledColor: AppColors
                                                            .appPrimaryColor,
                                                        emptyIcon:
                                                        Icons.star_border,
                                                        onRatingChanged: (
                                                            value) {
                                                          controllerReview
                                                              .rating.value =
                                                              value;
                                                          if (controllerReview
                                                              .rating.value ==
                                                              3.0) {
                                                            controllerReview
                                                                .type
                                                                .value = "Good";
                                                          }
                                                          if (controllerReview
                                                              .rating.value >=
                                                              4.0) {
                                                            controllerReview
                                                                .type.value =
                                                            "Very Good";
                                                          }
                                                          if (controllerReview
                                                              .rating.value ==
                                                              5.0) {
                                                            controllerReview
                                                                .type.value =
                                                            "Excellent";
                                                          }
                                                          if (controllerReview
                                                              .rating.value <=
                                                              2.0) {
                                                            controllerReview
                                                                .type.value =
                                                            "Bad";
                                                          }
                                                        },
                                                        initialRating:
                                                        controllerReview
                                                            .rating.value,
                                                        maxRating: 5,
                                                        size: 34,
                                                      ).marginSymmetric(
                                                          vertical: 8.h),
                                                    ).marginOnly(bottom: 8.h),
                                                    TextField(
                                                      controller: controllerReview
                                                          .reviewController,
                                                      maxLines: 6,
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xffEEEEEE)),
                                                        ),
                                                        filled: true,
                                                        hintStyle: TextStyle(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                .2),
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            fontSize: 16.sp),
                                                        hintText: "Write Review",
                                                        contentPadding:
                                                        EdgeInsets.only(
                                                            left: 12,
                                                            bottom: 5,
                                                            top: 10.h),
                                                        fillColor: Colors.white,
                                                      ),
                                                    ).paddingSymmetric(
                                                        horizontal: 20.w),
                                                    SizedBox(height: 20.h),
                                                    Obx(() {
                                                      return CustomButton(
                                                        isLoading: controllerReview
                                                            .isLoading.value,
                                                        title: 'Submit Review',
                                                        onPressed: () async {
                                                          var response =
                                                          await controllerReview
                                                              .submitReview(
                                                              booking);
                                                          if (response ==
                                                              "success") {
                                                            Get.back();
                                                          } else {
                                                            Get.snackbar(
                                                                "Error",
                                                                response);
                                                          }
                                                        },
                                                      );
                                                    }).paddingSymmetric(
                                                        horizontal: 20.w),
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    "Give Review",
                                    Color(0xffAFAFAF).withOpacity(.6),
                                  ):Button(() {
                                    Get.to(ScreenBooking(addHostVehicle: vehicle,));
                                  }, "Re-Book", AppColors.appPrimaryColor),
                                  Button(() {
                                    Get.to(ScreenUserChat());
                                  }, "Message", primaryColor),
                                ],
                              ).marginOnly(top: 14.h, left: 12.w, right: 12.w),
                            if (booking.bookingStatus == "Completed" &&
                                booking.isRated == true)
                            if (booking.bookingStatus == "Completed" &&
                                booking.isRated == true)
                              Text(
                                "Your Review",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "UrbanistBold",
                                ),
                              ).marginOnly(top: 14.h, left: 12.w, right: 12.w),
                            if (booking.bookingStatus == "Completed" &&
                                booking.isRated == true)
                              StreamBuilder<DocumentSnapshot>(
                                stream: reviewRef.doc(booking.bookingId).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState==ConnectionState.waiting) {
                                    return SizedBox();
                                  }
                                  var rating=Rating.fromMap(snapshot.data!.data() as Map<String,dynamic>);
                                  return ItemVehicleReview(rating: rating,)
                                      .marginOnly(
                                      top: 14.h, left: 12.w, right: 12.w);
                                }
                              ),
                            if (booking.bookingStatus == "Canceled")
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Button(() {}, "Re_Book", primaryColor),
                                  Button(() {
                                    Get.to(ScreenUserChat());
                                  }, "Message", primaryColor),
                                ],
                              ).marginOnly(top: 14.h, left: 12.w, right: 12.w),
                            if (booking.bookingStatus == "Canceled")
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0),
                                    child: Text(
                                      "Cancel Reason",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "UrbanistBold",
                                      ),
                                    ),
                                  ).marginOnly(
                                    top: 14.h,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor turpis quis ex eleifend, eget tempor diam ultricies. Nullam eu velit nec justo vestibulum aliquam. Duis auctor diam eu elit consequat, vel dapibus purus consequat.",
                                    style: TextStyle(
                                        color: Color(0xff414141),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp),
                                  ).marginSymmetric(horizontal: 20.w),
                                ],
                              ),
                          ],
                        ),
                      ).marginOnly(
                          left: 10.w, right: 10.w, top: 8.h, bottom: 12.h),
                    ],
                  ),
                );
              }),
        ));
  }

  Widget Button(VoidCallback onPressed, String title, Color buttonColor) {
    return SizedBox(
      // width: 170.w,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? primaryColor,
            // foregroundColor: Colors.grey,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
        child: Text(
          title ?? 'Button',
          style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "UrbanistBold",
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
    );
  }

  buildReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: Colors.black.withOpacity(.1),
          thickness: .5,
        ),
        Text(
          "Customer Review",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/images/user-image.png"),
          ),
          title: Text(
            "Kristin Watson",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1B1B1B)),
          ),
          subtitle: Text(
            "21 June, 2021",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 8.sp,
                color: Color(0xFF999999)),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.star,
                color: Color(0xFFFBC017),
              ),
              Text(
                "4.5",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
              )
            ],
          ),
        ),
        Text(
          'Review text popular belief, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsu...',
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF414141)),
        )
      ],
    ).marginSymmetric(vertical: 10.h);
  }

  Widget TextWidget(String title, description, String title2,
      String description2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${title}: ",
                style: TextStyle(
                    color: Color(0xff616161),
                    fontFamily: "UrbanistBold",
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp),
              ),
              Text(
                "${description}",
                style: TextStyle(
                    color: Color(0xff616161).withOpacity(.8),
                    fontFamily: "Urbanist",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${title2}: ",
                style: TextStyle(
                    color: Color(0xff616161),
                    fontFamily: "UrbanistBold",
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp),
              ),
              Text(
                "${description2}",
                style: TextStyle(
                    color: Color(0xff616161).withOpacity(.8),
                    fontFamily: "Urbanist",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ],
    ).marginOnly(bottom: 6.h);
  }

  ScreenBookingDetails({
    required this.booking,
    required this.host,
    required this.vehicle,
  });
}
//                      Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           CustomButton(
//                               width: 150.w,
//                               title: "Book Now", onPressed: (){
//                             Get.to(ScreenBooking());
//                           }),
//                           CustomButton(
//                               width: 150.w,
//                               title: "Message", onPressed: (){}).marginSymmetric(vertical: 5.h),
//                         ],
//                       ).marginSymmetric(vertical: 4.h),
