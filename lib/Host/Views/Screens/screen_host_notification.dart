import 'package:flutter/material.dart';

import '../Layouts/item_notification.dart';

class ScreenHostNotification extends StatelessWidget {
  const ScreenHostNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
          return ItemNotification();
        },),
      ),
    );
  }
}
