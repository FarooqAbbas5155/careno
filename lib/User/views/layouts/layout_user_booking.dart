import 'package:flutter/material.dart';

import 'layout_active_booking.dart';
import 'layout_completed_booking.dart';
import 'layout_pending_booking.dart';

class LayoutUserBooking extends StatelessWidget {
  const LayoutUserBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Booking"),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50), // Adjust height as needed
              child: Container(
                color: Color(0xffD8D8D8),
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                  tabs: [
                    Tab(text: "Active"),
                    Tab(text: "Pending"),
                    Tab(text: "Completed"),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              // Add LayoutPendingBooking(), LayoutActiveBooking(), and LayoutCompletedBooking() here
              LayoutPendingBooking(),
              LayoutActiveBooking  (),

              LayoutCompletedBooking(),
              Placeholder(),
            ],
          ),
        ),
      ),
    );
  }
}
