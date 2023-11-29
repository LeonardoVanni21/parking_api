import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:parking_api/models/post_model.dart';
import 'package:parking_api/screens/post_update_model_screen.dart';
import '../components/parking_spot.dart';
import 'package:intl/intl.dart';
import '../models/parking_model.dart';
import 'package:flutter/cupertino.dart';
import '../controllers/parking_spots_contoller.dart';

class ParkingDetails extends StatefulWidget {
  late final ParkingSpot spot;
  ParkingDetails({required this.spot}) : super();

  @override
  _ParkingDetailsState createState() => _ParkingDetailsState();
}

class _ParkingDetailsState extends State<ParkingDetails> {

  var controller = ParkingSpotsController();

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formattedDate = formatter.format(widget.spot.registrationDate);
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Icon(Icons.edit),
                splashRadius: 24.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostUpdateModelScreen(postModel: PostModel(
                      widget.spot.id,
                      widget.spot.parkingSpotNumber,
                      widget.spot.licensePlateCar,
                      widget.spot.brandCar,
                      widget.spot.modelCar,
                      widget.spot.colorCar,
                      null,
                      widget.spot.responsibleName,
                      widget.spot.apartment,
                      widget.spot.block,
                    ))),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: IconButton(
                icon: Icon(Icons.delete),
                splashRadius: 24.0,
                onPressed: () {
                  controller.delete(widget.spot.id.toString());
                  Get.back();
                },
              ),
            ),
          ],
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ParkingSpotBox(image: 'assets/images/car.png', width: 70.0),
                SizedBox(
                  height: 30.0,
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Id"),
                            Text(widget.spot.id.toString()),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Parking Spot Number"),
                            Text(widget.spot.parkingSpotNumber),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("License Plate Car"),
                            Text(widget.spot.licensePlateCar),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Brand"),
                            Text(widget.spot.brandCar),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Model"),
                            Text(widget.spot.modelCar),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Color"),
                            Text(widget.spot.colorCar),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Registration Date"),
                            Text(formattedDate),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Responsible Name"),
                            Text(widget.spot.responsibleName),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Apartment"),
                            Text(widget.spot.apartment),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Block"),
                            Text(widget.spot.block),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
