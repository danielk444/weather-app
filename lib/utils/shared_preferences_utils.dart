import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesUtils {
  SharedPreferencesUtils(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  final _temperatureUnitKey = 'TEMPERATURE_UNIT_KEY';

  Future<bool> setTemperatureUnit(bool isCelsius) {
    return _sharedPreferences.setBool(_temperatureUnitKey, isCelsius);
  }

  bool getTemperatureUnit() {
    return _sharedPreferences.getBool(_temperatureUnitKey) ?? true;
  }
}