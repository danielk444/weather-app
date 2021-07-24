import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/constants.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather(
      @JsonKey(name: 'weather_state_name') String weatherStateName,
      @JsonKey(name: 'weather_state_abbr') String weatherStateAbbr,
      @JsonKey(name: 'min_temp') double minTemp,
      @JsonKey(name: 'max_temp') double maxTemp,
      @JsonKey(name: 'the_temp') double theTemp,
      @JsonKey(name: 'air_pressure') double airPressure,
      @JsonKey(name: 'wind_speed') double windSpeed,
      @JsonKey(name: 'applicable_date') DateTime applicableDate,
      double humidity) = _Weather;

  const Weather._();

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  String get weatherStateImageUrl {
    return '$weatherApiBaseUrl/static/img/weather/$weatherStateAbbr.svg';
  }
}
