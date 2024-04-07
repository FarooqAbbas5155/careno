import 'package:flutter/material.dart';

import '../../../models/booking.dart';
import 'item_user_booking.dart';

class LayoutActiveBooking extends StatelessWidget {
  List<Booking> activeList;

  @override
  Widget build(BuildContext context) {
    return activeList.isNotEmpty?ListView.builder(
      itemCount: activeList.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemUserBooking(booking: activeList[index]);
      },):Center(child: Text("No Active Booking Yet"),);
  }

  LayoutActiveBooking({
    required this.activeList,
  });
}
