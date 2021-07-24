import 'package:weather_app/constants.dart';
import 'package:weather_app/strings.dart';

abstract class UnitConversionUtils {
  static String formatTemperature(
      {required double celsius, required bool isCelsius}) {
    if (isCelsius) {
      return '${celsius.toStringAsFixed(displayPrecisionDigits)}${Strings.celsiusSymbol}';
    }
    final fahrenheit = (celsius * 1.8) + 32;
    return '${fahrenheit.toStringAsFixed(displayPrecisionDigits)}${Strings.fahrenheitSymbol}';
  }

  static double toKilometersPerHour({required double mph}) => mph * 1.61;
}
