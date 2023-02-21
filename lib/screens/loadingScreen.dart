import 'package:flutter/material.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/utilities/location.dart';

import 'package:weather_app/widgets/constants.dart';

Constants constant = Constants();
var api = '4c8f56b366540903d6df175eb7038520';

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    location locate = location();
    await locate.getCurrentlocation();
    latitude = locate.latitude;
    longitude = locate.longitude;
    NetwrokHelper netwrokHelper = NetwrokHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
