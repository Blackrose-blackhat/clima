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
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    location locate = location();
    await locate.getCurrentlocation();
    NetwrokHelper netwrokHelper = NetwrokHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${locate.latitude}&lon=${locate.longitude}&appid=$apiKey&units=metric');
    var weatherData = await netwrokHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          children: const [
            SpinKitDoubleBounce(
              color: Color.fromARGB(255, 255, 255, 255),
              size: 100.0,
            ),
            Text('Retirieving you location'),
          ],
        ),
      ),
    );
  }
}
