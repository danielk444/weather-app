import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/api/weather_service.dart';
import 'package:weather_app/models/weather.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/strings.dart';

part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading()) {
    _fetchWeather();
  }

  int _selectedDayIndex = 0;
  List<Weather> _weather = [];

  _fetchWeather() async {
    try {
      final weather = await WeatherService.fetchWeather();
      _weather = weather;
      _emitWeatherDisplay();
    } catch (error) {
      emit(WeatherError(errorMessage: Strings.fetchWeatherErrorMessage));
    }
  }

  _emitWeatherDisplay() {
    emit(
        WeatherDisplay(weather: _weather, selectedDayIndex: _selectedDayIndex));
  }

  retryFetchWeather() {
    emit(WeatherLoading());
    _fetchWeather();
  }

  refreshWeather(Completer completer) async {
    await _fetchWeather();
    completer.complete();
  }

  onDaySelected(int index) {
    _selectedDayIndex = index;
    _emitWeatherDisplay();
  }
}
