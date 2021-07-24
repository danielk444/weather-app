import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/consolidated_weather.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/extensions/http_response_extension.dart';
import 'package:weather_app/strings.dart';

class WeatherService {
  static Future<List<Weather>> fetchWeather() async {
    try {
      final Uri uri = Uri.parse('$weatherApiBaseUrl$fetchWeatherUrl');
      final response = await http.get(uri);

      if (response.isSuccessful) {
        final json = jsonDecode(response.body);
        return ConsolidatedWeather.fromJson(json).weather;
      } else {
        throw Exception('Fetch weather error');
      }
    } catch (error) {
      throw Exception('Fetch weather error');
    }
  }
}
