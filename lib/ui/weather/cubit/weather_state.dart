part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherDisplay extends WeatherState {
  final List<Weather> weather;
  final int selectedDayIndex;

  WeatherDisplay(
      {required this.weather,
      required this.selectedDayIndex});
}

class WeatherReloading extends WeatherState {}

class WeatherError extends WeatherState {
  final String errorMessage;

  WeatherError({required this.errorMessage});
}
