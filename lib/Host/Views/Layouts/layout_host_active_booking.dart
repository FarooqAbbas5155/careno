import 'package:flutter/material.dart';

import '../../../models/booking.dart';
import 'item_host_booking.dart';

class LayoutHostActiveBooking extends StatelessWidget {
List<Booking> activeList;
  @override
  Widget build(BuildContext context) {
    return activeList.isNotEmpty?ListView.builder(
      itemCount: activeList.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemHostBooking(booking: activeList[index]);
      },):Center(child: Text("No Active Booking Yet"),);
  }

LayoutHostActiveBooking({
    required this.activeList,
  });
}
