import 'package:flutter/material.dart';

import 'item_host_booking.dart';

class LayoutHostCompletedBooking extends StatelessWidget {
  const LayoutHostCompletedBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ItemHostBooking(status: 'Completed',),
          ItemHostBooking(status: 'Canceled', ),
          ItemHostBooking(status: 'Completed',),
          ItemHostBooking(status: 'Completed',),
        ],
      ),
    );
  }
}
