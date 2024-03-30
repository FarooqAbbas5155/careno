import 'dart:ui';

import 'package:careno/AuthSection/screen_welcome.dart';
import 'package:careno/Host/Views/Screens/screen_host_home_page.dart';
import 'package:careno/User/views/screens/screen_user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../models/user.dart';
var uid = auth.FirebaseAuth.instance.currentUser!.uid;

var dbInstance = FirebaseFirestore.instance;
CollectionReference usersRef = dbInstance.collection("users");
Map<String, User> _allUsersMap = {};
Future<User> getUser(String id) async {
  var user = _allUsersMap[id];

  if (user == null) {
    var doc = await usersRef.doc(id).get();
    user = User.fromMap(doc.data() as Map<String, dynamic>);
    _allUsersMap[id] = user;
  }

  return user;
}

Color primaryColor = Color(0xff4C0AE1);
Future<Widget> getHomeScreen() async {
  Widget screen = ScreenWelcome();

  if (auth.FirebaseAuth.instance.currentUser != null) {
    var uid = auth.FirebaseAuth.instance.currentUser!.uid;
    var user = await getUser(uid);
    var registrationIncomplete = user.email.isEmpty ||
        user.name.isEmpty ||
        user.userType.isEmpty ||
        user.profileDescription.isEmpty ||
        user.imageUrl.isEmpty ||
        user.phoneNumner.isEmpty ||
        user.gender.isEmpty ||
        user.lat == 0.0 ||
  user.lng == 0.0 ||
  user.dob == null;
    if (registrationIncomplete) {
      screen = ScreenWelcome();
    }else if (user.userType == "host") {
      screen = ScreenHostHomePage();
    } else {
      screen = ScreenUserHome();
    }
  }

  return screen;
}
