import 'dart:convert';

class Weather {
  final String? cityName;
  final double? temperatureC;
  final double? temperatureF;
  // int? chanceOfRain;
  // DateTime? sunset;
  // DateTime? sunrise;
  // DateTime? currentDate;
  // String? description;
  // List<Forecast>? forecasts;

  Weather({
    // required this.latitude,
    //required this.longitude,
    this.cityName,
    this.temperatureC,
    this.temperatureF,
    //this.chanceOfRain,
    //this.sunrise,
    //this.currentDate,
    //this.description,
    //this.forecasts,
    //this.sunset
  });

  factory Weather.fromJson(String rawjson) {
    final jsondata = json.decode(rawjson);
    // List<Forecast> myForecastList = [];

    // final List<Map<String, dynamic>> forecastList = jsondata['forecast'];
    // forecastList.forEach(
    //   (element) {
    //     myForecastList.add(Forecast.fromJson(element));
    //   },
    // );

    // return Weather(
    //     latitude: jsondata['latitude'],
    //     longitude: jsondata['longitude'],
    //     city: jsondata['city'],
    //     temperature: jsondata['temperature'],
    //     chanceOfRain: jsondata['chanceOfRain'],
    //     forecasts: myForecastList);

    return Weather(
        cityName: jsondata['location']['name'],
        temperatureC: jsondata['current']['temp_c'],
        temperatureF: jsondata['current']['temp_f']);
  }
}

// class Forecast {
//   DateTime time;
//   String condtions;
//   int temperature;
//   Forecast(
//       {required this.time, required this.condtions, required this.temperature});

//   factory Forecast.fromJson(json) {
//     return Forecast(
//         time: json['forescats']['date'],
//         condtions: json['forescats']['conditions'],
//         temperature: json['forescats']['temperature']);
//   }

//   // object= Weather(latitude: latitude, longitude: longitude);
//   // object2 = Weather.fromJson(json)
// }

// class User {
//   final name;
//   final id;
//   final bio;
//   final language;
//   final version;

//   User({this.name, this.id, this.bio, this.language, this.version});

//   factory User.fromJson(Map<String, dynamic> rawData) {
//     return User(
//         id: rawData['id'],
//         name: rawData['name'],
//         language: rawData['language'],
//         version: rawData['version']);
//   }
// }
