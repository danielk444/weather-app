import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/models/weather.dart';

part 'consolidated_weather.freezed.dart';
part 'consolidated_weather.g.dart';

@freezed
class ConsolidatedWeather with _$ConsolidatedWeather {
  const factory ConsolidatedWeather(
          @JsonKey(name: 'consolidated_weather') List<Weather> weather) =
      _ConsolidatedWeather;

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);
}
