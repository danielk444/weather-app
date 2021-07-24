import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/utils/shared_preferences_utils.dart';

@injectable
class SettingsProvider extends ChangeNotifier {
  final SharedPreferencesUtils _preferencesUtils;

  SettingsProvider(this._preferencesUtils) {
    _isCelsius = _preferencesUtils.getTemperatureUnit();
  }

  bool _isCelsius = true;

  bool get isCelsius => _isCelsius;

  changeTemperatureUnit() {
    _isCelsius = !_isCelsius;
    _preferencesUtils.setTemperatureUnit(_isCelsius);
    notifyListeners();
  }
}
