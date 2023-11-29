

import 'parking_model.dart';

class ListParkingSpots {

  final List<ParkingSpot> listParkingSpots;


  ListParkingSpots(this.listParkingSpots);


  ListParkingSpots.fromJson(var json) :
        listParkingSpots = List.from(json).map((item) => ParkingSpot.fromJson(item)).toList() ;



}
