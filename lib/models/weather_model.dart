class Weather {
  final double latitude;
  final double longitude;
  final String? city;
  final int? temperature;
  int? chanceOfRain;
  DateTime? sunset;
  DateTime? sunrise;
  DateTime? currentDate;
  String? description;
  Forecast? forecasts;

  Weather(
      {required this.latitude,
      required this.longitude,
      this.city,
      this.temperature,
      this.chanceOfRain,
      this.sunrise,
      this.currentDate,
      this.description,
      this.forecasts,
      this.sunset});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        latitude: json['latitude'],
        longitude: json['longitude'],
        city: json['city'],
        temperature: json['temperature'],
        chanceOfRain: json['chanceOfRain'],
        forecasts: Forecast.fromJson(json));
  }
}

class Forecast {
  DateTime time;
  String condtions;
  int temperature;
  Forecast(
      {required this.time, required this.condtions, required this.temperature});

  factory Forecast.fromJson(json) {
    return Forecast(
        time: json['forescats']['date'],
        condtions: json['forescats']['conditions'],
        temperature: json['forescats']['temperature']);
  }

  // object= Weather(latitude: latitude, longitude: longitude);
  // object2 = Weather.fromJson(json)
}

// {
//   "latitude": 37.7749,
//   "longitude": -122.4194,
//   "city": "San Francisco",
//   "temperature": 18,
//   "chanceOfRain": 30,
//   "sunset": "2024-04-18T19:45:00Z",
//   "sunrise": "2024-04-18T06:30:00Z",
//   "currentDate": "2024-04-18T12:00:00Z",
//   "description": "Partly cloudy",
//   "forecasts": [
//     {
//       "date": "2024-04-18",
//       "temperature": 20,
//       "description": "Partly cloudy"
//     },
//     {
//       "date": "2024-04-19",
//       "temperature": 22,
//       "description": "Sunny"
//     },
//     {
//       "date": "2024-04-20",
//       "temperature": 19,
//       "description": "Rainy"
//     }
//   ]
// }
