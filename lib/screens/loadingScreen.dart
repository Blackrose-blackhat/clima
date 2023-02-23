import 'package:flutter/material.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/utilities/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/widgets/constants.dart';

import 'locationScreen.dart';

Constants constant = Constants();
var apiKey = '4c8f56b366540903d6df175eb7038520';

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
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await netwrokHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const LocationScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Color.fromARGB(255, 255, 255, 255),
          size: 100.0,
        ),
      ),
    );
  }
}
