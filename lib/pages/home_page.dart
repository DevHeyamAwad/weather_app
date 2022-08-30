import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            }),
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor(),
                  Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor()[50]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  const Text('Plestine',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Updated to  ',
                          style: TextStyle(
                            fontSize: 15,
                          )),
                      Text(
                          Provider.of<WeatherProvider>(context)
                              .weatherData!
                              .date
                              .day
                              .toString(),
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                      Text(
                          Provider.of<WeatherProvider>(context)
                              .weatherData!
                              .date
                              .month
                              .toString(),
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(Provider.of<WeatherProvider>(context)
                          .weatherData!
                          .getImage()),
                      const Text('40',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      Column(
                        children: const [
                          Text('minTemp',
                              style: TextStyle(
                                fontSize: 10,
                              )),
                          Text('minTemp',
                              style: TextStyle(
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text('Clear',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
