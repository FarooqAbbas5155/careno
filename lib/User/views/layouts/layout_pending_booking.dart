import 'package:flutter/material.dart';

import '../../../models/booking.dart';
import 'item_user_booking.dart';

class LayoutPendingBooking extends StatelessWidget {
 List<Booking> pendingList;
  @override
  Widget build(BuildContext context) {
    return pendingList.isNotEmpty?ListView.builder(
      itemCount: pendingList.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemUserBooking(booking: pendingList[index]);
      },):Center(child: Text("No Booking Yet"),);
  }

 LayoutPendingBooking({
    required this.pendingList,
  });
}
