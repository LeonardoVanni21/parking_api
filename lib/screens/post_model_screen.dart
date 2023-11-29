import 'package:parking_api/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/parking_spots_contoller.dart';

class PostModelScreen extends StatefulWidget {
  @override
  _PostModelScreenState createState() => _PostModelScreenState();
}

class _PostModelScreenState extends State<PostModelScreen> {
  final _formKey = GlobalKey<FormState>();
  var controller = ParkingSpotsController.listSpots;
  final _parkingSpotController = TextEditingController();
  final _licensePlateController = TextEditingController();
  final _brandCarController = TextEditingController();
  final _modelCarController = TextEditingController();
  final _colorCarController = TextEditingController();
  final _responsibleNameController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _blockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Parking Spot"),
        ),
        body: Container(
          color: Colors.black12,
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _parkingSpotController,
                        decoration: const InputDecoration(
                          hintText: 'Parking Spot',
                          border: OutlineInputBorder(), 
                          filled: true,
                          contentPadding: EdgeInsets.all(15),
                          hintStyle: TextStyle(color: Colors.grey), 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _licensePlateController,
                        decoration: const InputDecoration(
                          hintText: 'License Plate',
                          border: OutlineInputBorder(), 
                          filled: true,
                          contentPadding: EdgeInsets.all(15),
                          hintStyle: TextStyle(color: Colors.grey), 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _brandCarController,
                        decoration: const InputDecoration(
                          hintText: 'Brand Car',
                          border: OutlineInputBorder(), 
                          filled: true,
                          contentPadding: EdgeInsets.all(15),
                          hintStyle: TextStyle(color: Colors.grey), 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _modelCarController,
                        decoration: const InputDecoration(
                          hintText: 'Model Car',
                          border: OutlineInputBorder(), 
                          filled: true,
                          contentPadding: EdgeInsets.all(15),
                          hintStyle: TextStyle(color: Colors.grey), 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _colorCarController,
                        decoration: const InputDecoration(
                          hintText: 'Color Car',
                          border: OutlineInputBorder(), 
                          filled: true,
                          contentPadding: EdgeInsets.all(15),
                          hintStyle: TextStyle(color: Colors.grey), 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _responsibleNameController,
                        decoration: const InputDecoration(
                          hintText: 'Responsible Name',
                          border: OutlineInputBorder(), 
                          filled: true,
                          contentPadding: EdgeInsets.all(15),
                          hintStyle: TextStyle(color: Colors.grey), 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _apartmentController,
                        decoration: const InputDecoration(
                          hintText: 'Apartment',
                          border: OutlineInputBorder(), 
                          filled: true,
                          contentPadding: EdgeInsets.all(15),
                          hintStyle: TextStyle(color: Colors.grey), 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _blockController,
                        decoration: const InputDecoration(
                          hintText: 'Block',
                          border: OutlineInputBorder(), 
                          filled: true,
                          contentPadding: EdgeInsets.all(15),
                          hintStyle: TextStyle(color: Colors.grey), 
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            PostModel postModel = PostModel(
                              null,
                              _parkingSpotController.text,
                              _licensePlateController.text,
                              _brandCarController.text,
                              _modelCarController.text,
                              _colorCarController.text,
                              DateTime.now().toUtc().toIso8601String(),
                              _responsibleNameController.text,
                              _apartmentController.text,
                              _blockController.text,
                            );

                            var response = await controller.post(postModel);
                            if (response != false) {
                              Get.snackbar(
                                "Success",
                                "Saved with success",
                                icon: Icon(Icons.check, color: Colors.white),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.lightGreen,
                                colorText: Colors.white,
                              );
                            } else {
                              Get.snackbar(
                                "Occured an error",
                                "Error",
                                icon: Icon(Icons.error, color: Colors.white),
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.blue,
                                colorText: Colors.white,
                              );
                            }
                          }
                        },
                        child: const Text('Send'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 64, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
