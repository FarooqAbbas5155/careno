import 'dart:convert';
import 'dart:developer';
import 'package:careno/controllers/home_controller.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/firebase_utils.dart';

class PaymentsController2 extends GetxController {
  static const stripePublishableKey =
      "pk_test_51NLgXbIvUVFaiCUnwWS1LKKzwinTyl9JTxrhXSfCMXNowsrbtH7mvXntPk8FFYU853fyXS8xkBuFTUPFK6aeiu4X002TWuZasb";
  final String apiKey = "sk_test_51NLgXbIvUVFaiCUn6y61zHV16iTghOlCdebcS6Gq7oyjikt6qpEUDC483IGjLdOJMGjK9F6al9lzaqkZASX4j6dX00wlHuv43c";

  Rx<bool> paymentLoading = false.obs;
  Map<String, dynamic>? paymentIntent;

  // Future<void> makePayment(amount,productId, {Function(Map<String, dynamic> infoData)? onSuccess, Function(String error)? onError,}) async {
  //   try {
  //     paymentIntent = await createPaymentIntent(amount,productId);
  //
  //     // var gpay = PaymentSheetGooglePay(merchantCountryCode: "GB",
  //     //     currencyCode: "GBP",
  //     //     testEnv: true);
  //
  //     //STEP 2: Initialize Payment Sheet
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //           customerId: FirebaseUtils.myId,
  //             paymentIntentClientSecret: paymentIntent![
  //             'client_secret'], //Gotten from payment intent
  //             // style: ThemeMode.light,
  //             merchantDisplayName: Get.find<ControllerHome>().user.value!.name,
  //             // googlePay: gpay
  //         )
  //     ).then((value) {
  //     });
  //     print(paymentIntent.toString());
  //     Map<String, dynamic> infoData = {
  //       "id": "${paymentIntent?["id"] ?? ""}",
  //       "status": "paid",
  //       "amount": ((paymentIntent?["amount"] ?? -100) / 100),
  //       "created": paymentIntent?["created"] ?? 0,
  //       "currency": paymentIntent?["currency"] ?? "",
  //       "livemode": paymentIntent?["livemode"] ?? false,
  //     };
  //     //STEP 3: Display Payment sheet
  //     await displayPaymentSheet(onSuccess, infoData);
  //   } catch (err) {
  //     print(err);
  //   }
  // }
  Future<void> makePayment(String amount, String productId, {Function(Map<String, dynamic> infoData)? onSuccess, Function(String error)? onError}) async {
    try {
      paymentIntent = await createPaymentIntent(amount, productId);

      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            customerId: FirebaseUtils.myId,
            paymentIntentClientSecret: paymentIntent!['client_secret'],
            merchantDisplayName: Get.find<HomeController>().user.value!.name,
          )
      );

      Map<String, dynamic> infoData = {
        "id": "${paymentIntent?["id"] ?? ""}",
        "status": "paid",
        "amount": ((paymentIntent?["amount"] ?? -100) / 100),
        "created": paymentIntent?["created"] ?? 0,
        "currency": paymentIntent?["currency"] ?? "",
        "livemode": paymentIntent?["livemode"] ?? false,
      };

      await displayPaymentSheet(onSuccess, infoData);
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet(Function(Map<String, dynamic> infoData)? onSuccess, Map<String, dynamic> infoData) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        paymentIntent = null;
        if (onSuccess != null) {
          onSuccess(infoData);
        }
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String productId) async {
    try {
      final String corsUrl = "https://corsproxy.io/?";
      final String baseUrl = '${corsUrl}https://api.stripe.com/v1/payment_intents';

      var headers = <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $apiKey',
      };

      var response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: {
          "amount": (double.parse(amount) * 100).toStringAsFixed(0), // Convert to cents as an integer
          "currency": "usd",
          "payment_method_types[]": "card", // You can specify other payment methods here
          "metadata[product_id]": productId,
        },
      );

      log(response.body);

      return json.decode(response.body);
    } catch (err) {
      log(err.toString());
      throw Exception(err.toString());
    }
  }

// Future<String> makePayment(
//     String productId,
//     double amount,
//     Map<String, String> data,
//     String currency,
//     String merchantCountryCode,
//     String merchantDisplayName, {
//       Function(Map<String, dynamic> infoData)? onSuccess,
//       Function(String error)? onError,
//       ThemeMode? themeMode,
//       double? feePercent,
//     }) async {
//   paymentLoading.value = true;
//   try {
//     amount += amount * ((feePercent ?? 0.0) / 100);
//     int intAmount = amount.toInt();
//     intAmount = intAmount < amount ? (intAmount + 1) : intAmount;
//
//     print("Amount: $intAmount");
//
//     stripePaymentIntentData = await createPaymentIntent(
//       productId,
//       amount,
//       data,
//     );
//
//     if (stripePaymentIntentData == null) {
//       paymentLoading.value = false;
//       return "Payment intent data is null";
//     }
//
//     log("paymentIntentData $stripePaymentIntentData");
//
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: stripePaymentIntentData!['client_secret'],
//         style: themeMode,
//         merchantDisplayName: merchantDisplayName,
//       ),
//     ).catchError((error) {
//       log(error);
//     });
//     paymentLoading.value = false;
//
//     Map<String, dynamic> infoData = {
//       "id": "${stripePaymentIntentData?["id"] ?? ""}",
//       "status": "paid",
//       "amount": ((stripePaymentIntentData?["amount"] ?? -100) / 100),
//       "created": stripePaymentIntentData?["created"] ?? 0,
//       "currency": stripePaymentIntentData?["currency"] ?? "",
//       "livemode": stripePaymentIntentData?["livemode"] ?? false,
//     };
//
//     return _displayPaymentSheet(onSuccess, infoData);
//   } catch (e) {
//     paymentLoading.value = false;
//     log("makePayment Exc: $e");
//     if (onError != null) {
//       onError("$e");
//     }
//     return "Payment Error: $e";
//   }
// }
//
// Future<String> _displayPaymentSheet(
//     Function(Map<String, dynamic> infoData)? onSuccess,
//     Map<String, dynamic> infoData,
//     ) async {
//   try {
//     if (stripePaymentIntentData != null) {
//       await Stripe.instance.presentPaymentSheet(
//         parameters: PresentPaymentSheetParameters(
//           clientSecret: stripePaymentIntentData!['client_secret'],
//           confirmPayment: true,
//         ),
//       ).then((value) {
//         stripePaymentIntentData = null;
//         if (onSuccess != null) {
//           onSuccess(infoData);
//         }
//       });
//
//       return "success";
//     } else {
//       // Handle the case where stripePaymentIntentData is null
//       return "Payment intent data is null";
//     }
//   } on StripeException catch (e) {
//     log("displayPaymentSheet Exc: $e");
//     return "$e";
//   }
// }
//
// Future<Map<String, dynamic>?> createPaymentIntent(
//     String productId,
//     double price,
//     Map<String, String> data,
//     ) async {
//   final String corsUrl = "https://corsproxy.io/?";
//
//   final String baseUrl = '${corsUrl}https://api.stripe.com/v1';
//
//   var headers = <String, String>{
//     'Content-Type': 'application/x-www-form-urlencoded',
//     'Authorization': 'Bearer $_stripeSecretKey',
//   };
//
//   var priceResponse = await http.post(
//     Uri.parse('$baseUrl/prices'),
//     headers: headers,
//     body: {
//       "product": productId,
//       "unit_amount":
//       price != null ? (price * 100).toInt().toString() : "null",
//       "currency": "eur",
//     },
//   );
//
//   var priceData = jsonDecode(priceResponse.body);
//   var priceId = priceData['id'];
//   data['priceResponse'] = priceResponse.body;
//
//   // You should return the payment intent data here.
//   return stripePaymentIntentData;
// }
}