import 'package:careno/Host/Views/Layouts/layout_host_booking.dart';
import 'package:careno/Host/Views/Layouts/layout_host_earning.dart';
import 'package:careno/Host/Views/Layouts/layout_host_profile.dart';
import 'package:careno/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../User/views/layouts/layout_user_messages.dart';
import '../../../User/views/screens/screen_user_home.dart';

class ScreenHostHomePage extends StatelessWidget {
List<Widget> Layouts=[
  LayoutHostBooking(),
  LayoutUserMessages(),
  LayoutHostEarning(),
  LayoutHostProfile()
];
HomeController controller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(() {
            return Layouts[controller.selectHostIndex.value];
          }),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            // notchMargin: 10,
            // shape: CircularNotchedRectangle(),
            child: Container(
              height: 70.sp,
              child: Obx(() {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BottomBarItem(
                      icon: "assets/icons/booking.svg",
                      title: "Booking",
                      pageIndex: 0,
                      currentPageIndex: controller.selectHostIndex.value,
                      onTap: (index) {controller.selectHostIndex.value = index;
                        print(index);
                      },
                    ),
                    BottomBarItem(
                      icon: "assets/icons/message.svg",
                      title: "Messaging",
                      pageIndex: 1,
                      currentPageIndex: controller.selectHostIndex.value,
                      onTap: (index) {
                        print(index);

                        controller.selectHostIndex.value = index;
                      },
                    ),
                    BottomBarItem(
                      icon: "assets/icons/earning.svg",
                      title: "Earning",
                      pageIndex: 2,

                      currentPageIndex: controller.selectHostIndex.value,
                      onTap: (index) {
                        print(index);

                        controller.selectHostIndex.value = index;
                      },
                    ),
                    BottomBarItem(
                      icon: "assets/icons/profile.svg",
                      title: "Profile",
                      pageIndex: 3,

                      currentPageIndex: controller.selectHostIndex.value,
                      onTap: (index) {
                        print(index);

                        controller.selectHostIndex.value = index;
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        ));
  }
}
