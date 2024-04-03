import 'package:careno/AuthSection/screen_login.dart';
import 'package:careno/AuthSection/screen_welcome.dart';
import 'package:careno/Host/Views/Screens/screen_host_home_page.dart';
import 'package:careno/User/views/screens/screen_user_home.dart';
import 'package:careno/models/categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
Map<String,Category> _allCategoryMap = {};

Future<bool> hostProofAlreadyExists(String uid) async {
  final doc = await hostIdentityProofRef.doc(uid).get();
  return doc.exists;
}
Future<Category> getCategory(String id) async{
  var category = _allCategoryMap[id];
  if (category == null) {
    var doc = await categoryRef.doc(id).get();
    category = Category.fromMap(doc.data()as Map<String,dynamic>);
    _allCategoryMap[id] = category;

  }
  return category;
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
User defaultUser = User(
  userType: "",
  phoneNumber: "phoneNumber",
  imageUrl: "",
  name: '',
  email: '',
  profileDescription: '',
  dob: 0,
  lat: 0.0,
  lng: 0.0,
  uid: uid,
  gender: "",
  notification: false,
  notificationToken: '',
  timeStamp: DateTime.now().millisecondsSinceEpoch,
  isVerified: false,
  isBlocked: false,
  status: '',
);

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
Future<FilePickerResult?> PickFile(List<String> type) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: true,
    allowedExtensions: type,
  );
  var files = [];
  if (result != null) {
    PlatformFile file = result.files.first;
    print(file.name);
    print(file.bytes);
    print(files);
    print(file.size);
    print(file.extension);
    print(file.path);
  } else {
    Get.snackbar("Alert", "No File Pick");
  }
  return result;
}
