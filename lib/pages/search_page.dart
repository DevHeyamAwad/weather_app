import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/services/weather_service.dart';
import 'package:weather_app/providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  String? searchData;

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (data) {
              searchData = data;
            },
            onSubmitted: (data) async {
              searchData = data;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(searchData: searchData!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              print(weather);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getWeather(searchData: searchData!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  print(weather);
                  Navigator.pop(context);
                },
              ),
              border: OutlineInputBorder(),
              hintText: 'Enter City',
              labelText: 'Search a City',
            ),
          ),
        ),
      ),
    );
  }
}
