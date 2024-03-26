import 'package:flutter/material.dart';

import 'item_user_booking.dart';

class LayoutActiveBooking extends StatelessWidget {
  const LayoutActiveBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemUserBooking(status: 'In progress',),
        ItemUserBooking(status: 'In progress',),
        ItemUserBooking(status: 'In progress',),
      ],
    );
  }
}
