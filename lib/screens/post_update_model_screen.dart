import 'package:parking_api/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/parking_spots_contoller.dart';

class PostUpdateModelScreen extends StatefulWidget {
  final PostModel postModel;

  PostUpdateModelScreen({required this.postModel});
  @override
  _PostUpdateModelScreenState createState() => _PostUpdateModelScreenState();
}

class _PostUpdateModelScreenState extends State<PostUpdateModelScreen> {
  final _formKey = GlobalKey<FormState>();
  var controller = ParkingSpotsController.listSpots;
  var _parkingSpotController = TextEditingController();
  var _licensePlateController = TextEditingController();
  var _brandCarController = TextEditingController();
  var _modelCarController = TextEditingController();
  var _colorCarController = TextEditingController();
  var _responsibleNameController = TextEditingController();
  var _apartmentController = TextEditingController();
  var _blockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _parkingSpotController = TextEditingController(text: widget.postModel.parkingSpotNumber);
    _licensePlateController = TextEditingController(text: widget.postModel.licensePlateCar);
    _brandCarController = TextEditingController(text: widget.postModel.brandCar);
    _modelCarController = TextEditingController(text: widget.postModel.modelCar);
    _colorCarController = TextEditingController(text: widget.postModel.colorCar);
    _responsibleNameController = TextEditingController(text: widget.postModel.responsibleName);
    _apartmentController = TextEditingController(text: widget.postModel.apartment);
    _blockController = TextEditingController(text: widget.postModel.block);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Parking Spot"),
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
                          border: OutlineInputBorder(), // Add a border around the text field
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
                          border: OutlineInputBorder(), // Add a border around the text field
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
                          border: OutlineInputBorder(), // Add a border around the text field
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
                          border: OutlineInputBorder(), // Add a border around the text field
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
                          border: OutlineInputBorder(), // Add a border around the text field
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
                          border: OutlineInputBorder(), // Add a border around the text field
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
                          border: OutlineInputBorder(), // Add a border around the text field
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
                          border: OutlineInputBorder(), // Add a border around the text field
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
                              widget.postModel.id,
                              _parkingSpotController.text,
                              _licensePlateController.text,
                              _brandCarController.text,
                              _modelCarController.text,
                              _colorCarController.text,
                              null,
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
