import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerHostAddVechicle extends GetxController{
  RxString vehiclePath="".obs;
  // List<RxString> vehiclePaths = List.generate(4, (index) => "".obs);
  List<RxString> vehiclePaths = <RxString>[].obs;
  RxString vehicleNumberPlatePath="".obs;
  RxString vehicleRegistrationProofPath="".obs;
  RxString selectCategory="".obs;
  RxString selectFuelType="".obs;
  RxString selectTransmission="".obs;

}