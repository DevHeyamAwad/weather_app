import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherState;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(dynamic data) {
    var forecastData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(
            data['forecast']['forecastday'][0]["hour"][0]["time"]),
        temp: data['current']['temp_c'],
        maxTemp: forecastData['maxtemp_c'],
        minTemp: forecastData['mintemp_c'],
        weatherState: data['current']['condition']['text']);
  }

  @override
  String toString() {
    return 'date = $date temp = $temp maxTemp = $maxTemp minTemp = $minTemp weatherState = $weatherState';
  }

  String getImage() {
    if (weatherState == 'Icon' || weatherState == 'clear') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherState == 'Wind' || weatherState == 'Precip') {
      return 'assets/images/cloudy.png';
    } else if (weatherState == 'Cloud' || weatherState == 'Partly cloudy') {
      return 'assets/images/rainy.png';
    } else if (weatherState == 'Pressure' || weatherState == 'Temp') {
      return 'assets/images/snow.png';
    } else {
      return 'assets/images/thunderstorm.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherState == 'Icon' || weatherState == 'Clear') {
      return Colors.yellow;
    } else if (weatherState == 'Wind' || weatherState == 'Precip') {
      return Colors.cyan;
    } else if (weatherState == 'Cloud' || weatherState == 'Partly cloudy') {
      return Colors.green;
    } else if (weatherState == 'Pressure' || weatherState == 'Temp') {
      return Colors.grey;
    } else {
      return Colors.blue;
    }
  }
}
