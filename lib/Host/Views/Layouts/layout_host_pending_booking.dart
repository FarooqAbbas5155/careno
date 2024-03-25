import 'package:careno/Host/Views/Layouts/item_host_booking.dart';
import 'package:flutter/material.dart';

class LayoutHostPendingBooking extends StatelessWidget {
  const LayoutHostPendingBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemHostBooking(status: 'Pending',),
        ItemHostBooking(status: 'Pending',),
        ItemHostBooking(status: 'Pending',),
      ],
    );
  }
}
