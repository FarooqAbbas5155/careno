import 'package:careno/Host/Views/Layouts/item_host_booking.dart';
import 'package:flutter/material.dart';

import '../../../models/booking.dart';

class LayoutHostPendingBooking extends StatelessWidget {
List<Booking> pendingList;
  @override
  Widget build(BuildContext context) {
    return pendingList.isNotEmpty?ListView.builder(
      itemCount: pendingList.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemHostBooking(booking: pendingList[index]);
      },):Center(child: Text("No Booking Yet"),);
  }

LayoutHostPendingBooking({
    required this.pendingList,
  });
}
