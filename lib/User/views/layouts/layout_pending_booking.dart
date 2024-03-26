import 'package:flutter/material.dart';

import 'item_user_booking.dart';

class LayoutPendingBooking extends StatelessWidget {
  const LayoutPendingBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemUserBooking(status: 'Pending',),
        ItemUserBooking(status: 'Pending',),
        ItemUserBooking(status: 'Pending',),
      ],
    );
  }
}
