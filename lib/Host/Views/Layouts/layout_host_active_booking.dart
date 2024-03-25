import 'package:flutter/material.dart';

import 'item_host_booking.dart';

class LayoutHostActiveBooking extends StatelessWidget {
  const LayoutHostActiveBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemHostBooking(status: 'In progress',),
        ItemHostBooking(status: 'In progress',),
        ItemHostBooking(status: 'In progress',),
      ],
    );
  }
}
