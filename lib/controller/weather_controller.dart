// HTTP REQUESTS: GET, POST, PATCH

import 'dart:convert';

import 'package:diraction/models/weather_model.dart';
import 'package:http/http.dart' as https;

const baseUrl = "http://api.weatherapi.com/v1/";
const ApiKey = "df6d173f90d04e2ea33191810242104";

class WeatherController {
  static Future<Weather> fetchData(String cityName) async {
    await Future.delayed(Duration(seconds: 2));
    final Uri apiEndpoint =
        Uri.parse("${baseUrl}current.json?q=${cityName}&key=${ApiKey}");

    final response = await https.get(apiEndpoint);

    print(response.body);

    if (response.statusCode == 400) {
      return Weather(
          cityName: "City Not Found", temperatureC: null, temperatureF: null);
    }

    return Weather.fromJson(response.body);
  }
}
