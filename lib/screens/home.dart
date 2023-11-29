import 'package:parking_api/screens/parking_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:parking_api/screens/post_model_screen.dart';

import '../components/parking_spot.dart';
import '../controllers/parking_spots_contoller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var controller = ParkingSpotsController.listSpots;
  @override
  void initState() {
    super.initState();

    controller.listParkingSpots();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Used Parking Spots"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Icon(Icons.refresh),
                splashRadius: 24.0,
                onPressed: () {
                  controller.listParkingSpots();
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: IconButton(
                icon: Icon(Icons.add),
                splashRadius: 24.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostModelScreen()),
                  );
                },
              ),
            ),
          ],
        ),

        body:
        Obx(() =>
        controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            :
        Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.listParkingSpotsObs.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  Card(
                    child: ListTile(
                      onTap: () {
                        Get.to(ParkingDetails(spot:  controller.listParkingSpotsObs[index]), fullscreenDialog: true);
                      },
                      leading:
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child:
                          ParkingSpotBox(image: 'assets/images/car.png',width: 50.0)
                      ),
                      title:
                      Text(controller.listParkingSpotsObs[index].brandCar + " " +
                          controller.listParkingSpotsObs[index].modelCar +  " " +
                          controller.listParkingSpotsObs[index].colorCar + " - " +
                          controller.listParkingSpotsObs[index].parkingSpotNumber),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  );
              }),
        )
        )
    );
  }
}