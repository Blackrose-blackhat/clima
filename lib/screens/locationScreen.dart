import 'package:flutter/material.dart';
import 'package:weather_app/services/weatherModel.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({super.key, this.locationWeather});
  @override
  State<LocationScreen> createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late int condition;
  late String cityName;
  late String weatherIcon;
  late String weatherdesc;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    weatherIcon = weather.getWeatherModel(condition);
    weatherdesc = weather.getMessage(temperature);
    print(temperature);
    print(condition);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 60,
          ),
        ),
      ),
      home: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          height: 790,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.location_pin,
                      size: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 260,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temperature˚',
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Image.asset(
                      'assets/images/$weatherIcon',
                      height: 82,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 90,
                ),
                Text(
                  '$weatherdesc',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
