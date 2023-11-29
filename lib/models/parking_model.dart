class ParkingSpot {

  final String id;
  final String parkingSpotNumber;
  final String licensePlateCar;
  final String brandCar;
  final String modelCar;
  final String colorCar;
  final DateTime registrationDate;
  final String responsibleName;
  final String apartment;
  final String block;

  ParkingSpot({
    required this.id,
    required this.parkingSpotNumber,
    required this.licensePlateCar,
    required this.brandCar,
    required this.modelCar,
    required this.colorCar,
    required this.registrationDate,
    required this.responsibleName,
    required this.apartment,
    required this.block,
  });

  ParkingSpot.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        parkingSpotNumber = json['parkingSpotNumber'],
        licensePlateCar = json['licensePlateCar'],
        brandCar = json['brandCar'],
        modelCar = json['modelCar'],
        colorCar = json['colorCar'],
        registrationDate = DateTime.parse(json['registrationDate']),
        responsibleName = json['responsibleName'],
        apartment = json['apartment'],
        block = json['block'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'parkingSpotNumber': parkingSpotNumber,
    'licensePlateCar': licensePlateCar,
    'brandCar': brandCar,
    'modelCar': modelCar,
    'colorCar': colorCar,
    'registrationDate': registrationDate.toIso8601String(),
    'responsibleName': responsibleName,
    'apartment': apartment,
    'block': block,
  };
}
