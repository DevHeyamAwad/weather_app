import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '11df124a6f3a449e83f35610220208';

  Future<WeatherModel?> getWeather({required String searchData}) async {
    WeatherModel? weather;
    try {
      print(searchData);
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$searchData&days=1&aqi=no&alerts=no');

      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
