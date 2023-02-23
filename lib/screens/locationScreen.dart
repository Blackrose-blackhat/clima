import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});
  @override
  State<LocationScreen> createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen> {
  @override
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
              image: AssetImage(''),
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
                    Icon(
                      Icons.location_city,
                      size: 50,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 260,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      '32˚',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Icon(
                      Icons.sunny,
                      size: 90,
                      color: Colors.amber,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 90,
                ),
                const Text(
                  'Weather description here ',
                  textAlign: TextAlign.right,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
