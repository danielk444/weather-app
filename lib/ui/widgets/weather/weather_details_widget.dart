import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/strings.dart';
import 'package:weather_app/utils/unit_conversion_utils.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final Weather weather;

  WeatherDetailsWidget({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Paddings.linePadding),
        Text(
            Strings.humidity(
                weather.humidity.toStringAsFixed(displayPrecisionDigits)),
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: FontSize.h6)),
        SizedBox(height: Paddings.linePadding),
        Text(
            Strings.pressure(
                weather.airPressure.toStringAsFixed(displayPrecisionDigits)),
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: FontSize.h6)),
        SizedBox(height: Paddings.linePadding),
        Text(
            Strings.wind(
                UnitConversionUtils.toKilometersPerHour(mph: weather.windSpeed)
                    .toStringAsFixed(displayPrecisionDigits)),
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: FontSize.h6)),
      ],
    );
  }
}
