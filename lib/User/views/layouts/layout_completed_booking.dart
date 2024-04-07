import 'package:flutter/material.dart';

import '../../../models/booking.dart';
import 'item_user_booking.dart';

class LayoutCompletedBooking extends StatelessWidget {
  List<Booking> completedList;

  @override
  Widget build(BuildContext context) {
    return completedList.isNotEmpty?ListView.builder(
      itemCount: completedList.length,
      itemBuilder: (BuildContext context, int index) {
      return ItemUserBooking(booking: completedList[index]);
    },):Center(child: Text("No Completed Booking Yet"),);
  }

  LayoutCompletedBooking({
    required this.completedList,
  });
}
