import 'package:careno/constant/helpers.dart';
import 'package:get/get.dart';

import '../Host/Views/Screens/screen_host_account_pending.dart';
import '../constant/firebase_utils.dart';
import '../models/host_identity.dart';

class ControllerHostAddIdentityProof extends GetxController {
  RxString insurancePath = "".obs;
  RxString idFrontPath = "".obs;
  RxString idBackPath = "".obs;



  Future<void> sethostIdentityProof() async {
    String insurancePathUrl = await FirebaseUtils.uploadImage(insurancePath.value, "Host/IdentityProof/${FirebaseUtils.myId}/image/insurancePath");
    String idFrontPathUrl = await FirebaseUtils.uploadImage(idFrontPath.value, "Host/IdentityProof/${FirebaseUtils.myId}/image/idFrontPath/");
    String idBackPathUrl = await FirebaseUtils.uploadImage(insurancePath.value, "Host/IdentityProof/${FirebaseUtils.myId}/image/idBackPath/");

    HostIdentity hostIdentity = HostIdentity(
        hostId: FirebaseUtils.myId,
        insurancePath: insurancePathUrl,
        idFrontPath: idFrontPathUrl,
        idBackPath: idBackPathUrl,
    );
    await hostIdentityProofRef.doc(uid).set(hostIdentity.toMap()).then((value) {
      print("Sccessfull Upload");
      Get.to(ScreenHostAccountPending());


    }).catchError((error){print(error.toString());});
  }
}