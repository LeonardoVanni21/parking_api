
import 'package:parking_api/models/post_model.dart';
import 'package:get/get.dart';

import '../models/parking_model.dart';
import '../services/parking_service.dart';


class ParkingSpotsController extends GetxController {

  ParkingSpotService parkingService = ParkingSpotService();

  var isLoading = false.obs;

  var listParkingSpotsObs = <ParkingSpot>[].obs;

  static ParkingSpotsController get listSpots => Get.find();
  
  Future<dynamic> listParkingSpots()  async {
    isLoading.value = true;
    var list = await parkingService.fetchListParkingSpots();
    listParkingSpotsObs.value = list.listParkingSpots;
    isLoading.value = false;
    update();
    return listParkingSpotsObs;
  }

  Future<dynamic> post(PostModel objeto)  async {
    isLoading.value = true;
    var list = await parkingService.saveOrUpdate(objeto);
    isLoading.value = false;
    update();
    return list;
  }


}
