import 'package:flutter/material.dart';

import 'item_user_booking.dart';

class LayoutCompletedBooking extends StatelessWidget {
  const LayoutCompletedBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ItemUserBooking(status: 'Completed',),
          ItemUserBooking(status: 'Canceled', ),
          ItemUserBooking(status: 'Completed',),
          ItemUserBooking(status: 'Completed',),
        ],
      ),
    );
  }
}
