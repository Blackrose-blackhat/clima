import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class location {
  late double latitude;
  late double longitude;
  Future<void> getCurrentlocation() async {
    try {
      Position? position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
