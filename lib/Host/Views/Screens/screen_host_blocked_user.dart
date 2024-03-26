import 'package:careno/Host/Views/Layouts/item_blocked_users.dart';
import 'package:flutter/material.dart';

class ScreenHostBlockedUser extends StatelessWidget {
  const ScreenHostBlockedUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Blocked Users"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
        return ItemBlockedUsers();
      },)
    ));
  }
}
