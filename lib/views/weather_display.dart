import 'dart:async';

import 'package:diraction/controller/weather_controller.dart';
import 'package:diraction/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherDisplay extends StatefulWidget {
  final Weather weatherData;
  WeatherDisplay(this.weatherData, {super.key});

  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  final _numberStreamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _startAddingNumbers();
  }

  void _startAddingNumbers() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2)); // Delay for 2 seconds.
      _numberStreamController.sink.add(i); // Add the number to the stream.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
          stream: _numberStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("An error has occured"),
              );
            } else {
              return Center(child: Text(snapshot.data.toString()));
            }
          },
        )

        // FutureBuilder(
        //   future: WeatherController.fetchData("lAHORE"),
        //   builder: ((context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (snapshot.hasError) {
        //       return Center(
        //         child: Text("An error has occurred while fetching data"),
        //       );
        //     } else {
        //       return Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Center(
        //             child: Text(snapshot.data!.cityName ?? "City Not Found"),
        //           ),
        //           SizedBox(
        //             height: 10,
        //           ),
        //           Center(
        //             child: Text(snapshot.data!.temperatureC.toString() ??
        //                 "City Not Found"),
        //           ),
        //           SizedBox(
        //             height: 10,
        //           ),
        //           Center(
        //             child: Text(snapshot.data!.temperatureC.toString() ??
        //                 "City Not Found"),
        //           ),
        //         ],
        //       );
        //     }
        //   }),
        // )
        );
  }
}
