import 'package:chefease/TabBarScreens/MapDemo.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          top: 20,
          child: Icon(
            Icons.lock_clock,
            size: 30,
            color: Color(0xFFFF6A42),
          ),
        ),
        Positioned(
          left: 60,
          top: 35,
          child: Text(
            'Open 24 hrs',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              height: 0.09,
              letterSpacing: -0.13,
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 60,
          child: Icon(
            Icons.location_on,
            size: 30,
            color: Color(0xFFFF6A42),
          ),
        ),
        Positioned(
          left: 60,
          top: 75,
          child: Text(
            'GT Road, Islamabad',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              height: 0.09,
              letterSpacing: -0.13,
            ),
          ),
        ),
        // Expanded container to allow the map to occupy available space
        Positioned(
          top: 120,
          left: 20,
          child: Container(
              width: 390,
              height: 250,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),

              ),
            child: MapSample()
          ),
        ),
      ],
    );
  }
}
