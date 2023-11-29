import 'package:flutter/cupertino.dart';

class ParkingSpotBox extends StatelessWidget {
  final String image;
  final double width;

  const ParkingSpotBox({required this.image, required this.width}) : super();

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: image,
        child:
        Image.asset(image,fit: BoxFit.contain)
      ),
    );
  }
}
