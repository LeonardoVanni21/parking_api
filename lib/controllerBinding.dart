import 'package:get/get.dart';

import 'controllers/parking_spots_contoller.dart';

class ControllerBinding implements Bindings  {
  @override
  void dependencies(){
    Get.lazyPut<ParkingSpotsController>(() => ParkingSpotsController());
  }

}