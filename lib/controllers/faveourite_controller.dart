import 'package:get/get.dart';

import '../constant/helpers.dart';
import '../interfaces/like_listener.dart';

class FavouriteController extends GetxController{



RxString vehicelId = "".obs;
  @override
  void onInit() {
checkForLikes(vehicelId.value, this as LikeListener);
    super.onInit();
  }
  void checkForLikes(String vehical_id, LikeListener listener) {
    List<String> likes = [];
    addVehicleRef.doc(vehical_id).collection("likes").snapshots().listen((event) {
      likes = event.docs
          .map((e) => ((e.data() as Map<String, dynamic>)['uid']).toString())
          .toList();
      listener.onLikesUpdated(likes);
    });
  }

}