import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String getWeatherModel(int condition) {
    if (condition < 300) {
      return 'thunder.png';
    } else if (condition < 400) {
      return 'light_rain.png';
    } else if (condition < 600) {
      return 'rain.png';
    } else if (condition < 700) {
      return 'snow.png';
    } else if (condition <= 800) {
      return 'sun.png';
    } else if (condition == 804) {
      return 'cloud.png';
    } else {
      return 'don\'t_know';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\s 🍦 time';
    } else if (temp > 20) {
      return 'It\s time for 🩳 ';
    } else if (temp < 10) {
      return 'You\ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
