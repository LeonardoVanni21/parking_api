class PostModel {
  final String? id;
  final String parkingSpotNumber;
  final String licensePlateCar;
  final String brandCar;
  final String modelCar;
  final String colorCar;
  final String? registrationDate;
  final String responsibleName;
  final String apartment;
  final String block;

  PostModel(
    this.id,
    this.parkingSpotNumber,
    this.licensePlateCar,
    this.brandCar,
    this.modelCar,
    this.colorCar,
    this.registrationDate,
    this.responsibleName,
    this.apartment,
    this.block,
  );

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        parkingSpotNumber = json['parkingSpotNumber'],
        licensePlateCar = json['licensePlateCar'],
        brandCar = json['brandCar'],
        modelCar = json['modelCar'],
        colorCar = json['colorCar'],
        registrationDate = json['registrationDate'],
        responsibleName = json['responsibleName'],
        apartment = json['apartment'],
        block = json['block'];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'parkingSpotNumber': parkingSpotNumber,
      'licensePlateCar': licensePlateCar,
      'brandCar': brandCar,
      'modelCar': modelCar,
      'colorCar': colorCar,
      'responsibleName': responsibleName,
      'apartment': apartment,
      'block': block,
    };

    if (id != null) {
      data['id'] = id;
    }
    if (registrationDate != null) {
      data['registrationDate'] = registrationDate;
    }
    return data;
  }
}
