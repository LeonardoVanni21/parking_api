
import 'package:parking_api/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controllerBinding.dart';

void main() {
  ControllerBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //MaterialApp(
      title: 'THE BEST PARKING LOT',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Parking Lot'),
    );
  }
}


