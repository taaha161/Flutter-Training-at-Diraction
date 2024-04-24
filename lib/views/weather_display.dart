import 'package:diraction/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weatherData;
  const WeatherDisplay(this.weatherData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(weatherData.cityName ?? "City Not Found"),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child:
                Text(weatherData.temperatureC.toString() ?? "City Not Found"),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child:
                Text(weatherData.temperatureF.toString() ?? "City Not Found"),
          ),
        ],
      ),
    );
  }
}
