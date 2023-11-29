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

  Future<dynamic> delete(String id) async {
    http.Response response;

    response = await http.delete(
        Uri.parse(
            "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/$id"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> saveOrUpdate(PostModel objeto) async {
    http.Response response;

    if (objeto.id != null) {
      response = await http.post(
          Uri.parse(
              "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/edit"),
          body: json.encode(objeto.toJson()),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
    } else {
      response = await http.post(
          Uri.parse(
              "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/save"),
          body: json.encode(objeto.toJson()),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(response.body);
      return PostModel.fromJson(retorno);
    } else {
      return false;
    }
  }
}
