import 'package:careno/AuthSection/screen_login.dart';
import 'package:careno/AuthSection/screen_welcome.dart';
import 'package:careno/Host/Views/Screens/screen_host_home_page.dart';
import 'package:careno/User/views/screens/screen_user_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';

import '../Host/Views/Screens/screen_host_add_ident_identity_proof.dart';
import '../models/user.dart';

var uid = auth.FirebaseAuth.instance.currentUser!.uid;
String image_url = "https://phito.be/wp-content/uploads/2020/01/placeholder.png";
String googleApiKey = 'AIzaSyCjxRhtdw74nJ9YdYaGjvY5IZUEA5Ux0JA';

var dbInstance = FirebaseFirestore.instance;
CollectionReference usersRef = dbInstance.collection("users");
CollectionReference hostIdentityProofRef = dbInstance.collection("identies");
CollectionReference categoryRef = dbInstance.collection("categories");
CollectionReference addVehicleRef = dbInstance.collection("vehicles");
Map<String, User> _allUsersMap = {};

Future<bool> hostProofAlreadyExists(String uid) async {
  final doc = await hostIdentityProofRef.doc(uid).get();
  return doc.exists;
}

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
  Widget screen = ScreenLogin();
  if (auth.FirebaseAuth.instance.currentUser != null) {
    var uid = auth.FirebaseAuth.instance.currentUser!.uid;
    var user = await getUser(uid);
    if (user.userType == "") {
      screen = ScreenWelcome();
    } else if (user.userType == "host") {
      if (user.hostIdentity == null) {
        screen = ScreenHostAddIdentIdentityProof();
      } else {
        screen = ScreenHostHomePage();
      }
    } else {
      screen = ScreenUserHome();
    }
  }

  return screen;
}
