import 'package:careno/AuthSection/screen_complete_profile.dart';
import 'package:careno/AuthSection/screen_login.dart';
import 'package:careno/AuthSection/screen_otp.dart';
import 'package:careno/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:careno/models/user.dart' as userModle;

import '../constant/helpers.dart';


class PhoneController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  var pinPutController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;

  RxBool loading = false.obs;
  var isButtonEnabled = true.obs;
  final _auth = FirebaseAuth.instance;
  String _verificationId = "";
  int _resendToken = 0;
  final showLoading = false.obs;
  String country_code = "+1";
  var _googleAccount = Rx<GoogleSignInAccount?>(null);
  var _googleSignIn = GoogleSignIn();
  late AuthCredential authCredential;

  // Rx<TextEditingController> phoneController = Rx(TextEditingController());
  RxString gender = "Male".obs;

  // @override
  // void onInit() {
  //   sendVerificationCode();
  //   super.onInit();
  // }

  void verifyPin(String pin) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: pin);
    try {
      await _auth.signInWithCredential(phoneAuthCredential).then((value) {
        return verificationCompleted(value);
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      showSnackBar(e.message.toString());
    }
  }

  Future<void> verificationCompleted(UserCredential credential) async {
    showLoading.value = true;
    update();
    bool alreadyExists = await userAlreadyExists(credential.user!.uid);
    if (alreadyExists) {
      var screen = await getHomeScreen();
      Get.offAll(screen);
    } else {
      await completeRegistration(credential);
    }
  }

  Future<void> sendVerificationCode() async {
    String phone = phoneController.value.text;
    if (country_code.isEmpty || phone.isEmpty) {
      Get.snackbar("Alert", "Phone is required!",backgroundColor: primaryColor);
      return;
    }

    String full_phone = country_code + phoneController.value.text;
    Get.to(ScreenOtp());
    print(full_phone);

    await _auth.verifyPhoneNumber(
      phoneNumber: (full_phone),
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        _auth.signInWithCredential(credential).then((value) {
          pinPutController.value.text = credential.smsCode ?? "";

          verificationCompleted(value);
        }).catchError((error) {
          showSnackBar(error.toString());
          print(error.toString());
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBar(e.message.toString());
        print(e);
        Get.back();
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        _resendToken = resendToken ?? 0;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void showSnackBar(String message) {
    Get.snackbar("Alert", message);
  }

  Future<String> completeRegistration(UserCredential userCredential) async {
    String response = "";
    var user = userModle.User(
        userType: homeController.userType.value,
        phoneNumner:country_code + phoneController.value.text,
        imageUrl: "",
        name: '',
        email: '',
        profileDescription: '',
        dob: null?? 0,
        lat:  0.0,
        lng:0.0, uid: uid,
      gender: "",
    );

    // newUser.id = userCredential.user!.uid;
    //
    await
    await setDatabase(user).then((value) {
      if (value == "success") {

      }
    });
    //
    showLoading.value = false;
    update();

    return response;
  }

  Future<String> setDatabase(userModle.User user) async {
    String response = "";
    await usersRef.doc(user.uid).set(user.toMap()).then((value) {
      response = "success";
      Get.to(ScreenCompleteProfile());

    }).catchError((error) {
      Get.snackbar("Error", error.toString());
      response = error;
    });

    return response;
  }

  Future<bool> userAlreadyExists(String uid) async {
    final doc = await usersRef.doc(uid).get();
    return doc.exists;
  }

  // Future<String> signInWithGoogle(String type) async {
  //   String response = "";
  //   _googleAccount.value = await _googleSignIn.signIn();
  //   var googleUser = _googleAccount.value;
  //
  //   if (googleUser != null) {
  //     try {
  //       final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
  //
  //       final AuthCredential googleCredential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth!.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //       // final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookCredential);
  //
  //       print(googleUser.id);
  //       if (await checkIfAuthIdExists(googleUser.id)) {
  //         Get.snackbar("Account exists", "Signing you in");
  //         final userCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);
  //         print(userCredential.user!.uid);
  //         //Get.offAll(ScreenHome());
  //         return "";
  //       }
  //
  //       if (type == "phone") {
  //         Get.snackbar("Alert", "This google account is not registered");
  //         return "";
  //       }
  //       final userCredential = await FirebaseAuth.instance.signInWithCredential(
  //           googleCredential);
  //       var user = userCredential.user!;
  //       var phoneNumber = user.phoneNumber ?? '';
  //       var imageUrl = user.photoURL ?? '';
  //       var  userName = (googleUser.displayName ?? "").split(" ");
  //       var Name = userName;
  //
  //       Get.snackbar("Creating Account", "Please wait", colorText: Colors.white,
  //           backgroundColor: Color(0xffFE7145));
  //
  //       authCredential = googleCredential;
  //       var newUser = userModle.User(
  //         uid: userCredential.user!.uid,
  //         name: Name.toString(),
  //         gender: "",
  //         verified: false,
  //         user_type: "buyer",
  //         education: "",
  //         ethin_group: "",
  //         profession: "",
  //         dob: 1,
  //         imageUrl: imageUrl,
  //         notificationToken: "",
  //         phoneNumber: phoneNumber.toString(),
  //         countryCode: phoneNumber.toString(),
  //         cnicNumber: "",
  //         unblocked: false,
  //         authType: "google",
  //         status: "",
  //       );
  //
  //       usersRef.doc(user.uid).set(newUser.toMap()).then((value) {
  //         Get.to(ScreenBuyerHome());
  //       });
  //
  //       // response = await Get.to(ScreenAddMoreDetails());
  //
  //       // if (resultUser != null) {
  //       //   response = "success";
  //       // }
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  //   return response;
  // }


  Future<bool> checkIfUidExists(String uid) async {
    var doc = await usersRef.doc(uid).get();
    return doc.exists;
  }

  Future<bool> checkIfAuthIdExists(String authId) async {
    var snap = await usersRef.where("authId", isEqualTo: authId).get();
    print(snap);
    return snap.docs.isNotEmpty;
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    Get.offAll(ScreenLogin());
  }
}
