import 'dart:convert';
import 'package:parking_api/models/post_model.dart';
import 'package:http/http.dart' as http;
import '../models/list_parking_spots_model.dart';

class ParkingSpotService {
  String url =
      "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/list";
  dynamic _response;
  ParkingSpotService() {
    _response = "";
  }

  Future<ListParkingSpots> fetchListParkingSpots() async {
    _response = await http.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      var retorno = json.decode(_response.body);
      return ListParkingSpots.fromJson(retorno);
    } else {
      throw Exception('Failed to load cote');
    }
  }

  Future<dynamic> saveOrUpdate(PostModel objeto) async {
    http.Response _response;

    if (objeto.id != null) {
      _response = await http.post(
          Uri.parse(
              "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/edit"),
          body: json.encode(objeto.toJson()),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
    } else {
      _response = await http.post(
          Uri.parse(
              "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/save"),
          body: json.encode(objeto.toJson()),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
    }

    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return PostModel.fromJson(retorno);
    } else {
      return false;
    }
  }
}
