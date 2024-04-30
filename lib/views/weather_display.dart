import 'package:diraction/controller/weather_controller.dart';
import 'package:diraction/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weatherData;
  const WeatherDisplay(this.weatherData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: WeatherController.fetchData("lAHORE"),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("An error has occurred while fetching data"),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(snapshot.data!.cityName ?? "City Not Found"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(snapshot.data!.temperatureC.toString() ??
                        "City Not Found"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(snapshot.data!.temperatureC.toString() ??
                        "City Not Found"),
                  ),
                ],
              );
            }
          }),
        ));
  }
}
