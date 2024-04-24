import 'package:diraction/controller/weather_controller.dart';
import 'package:diraction/models/weather_model.dart';
import 'package:diraction/views/weather_display.dart';
import 'package:flutter/material.dart';

class WeatherHomepage extends StatelessWidget {
  final TextEditingController citySearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My First Weather App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: citySearchController,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                final Weather weatherObject = await WeatherController.fetchData(
                    citySearchController.text);
                // final weatherObject = Weather(
                //     cityName: "Lahore", temperatureC: 37, temperatureF: 98);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeatherDisplay(weatherObject)));
              },
              child: Text("Fetch Weather"))
        ],
      ),
    );
  }
}
