import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/extensions/date_time_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/unit_conversion_utils.dart';

class WeatherListDayTileWidget extends StatelessWidget {
  final Weather weather;

  WeatherListDayTileWidget({required this.weather});

  static const tileSize = 120.0;
  static const _imageSize = 50.0;
  static const tileElevation = 2.0;

  @override
  Widget build(BuildContext context) {
    final isCelsius = Provider.of<SettingsProvider>(context).isCelsius;
    final minTemp = UnitConversionUtils.formatTemperature(
        celsius: weather.minTemp, isCelsius: isCelsius);
    final maxTemp = UnitConversionUtils.formatTemperature(
        celsius: weather.maxTemp, isCelsius: isCelsius);

    return Card(
      elevation: tileElevation,
      child: SizedBox(
        width: tileSize,
        height: tileSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weather.applicableDate.dayAbbr(), textAlign: TextAlign.center),
            SizedBox(height: Paddings.linePadding),
            SvgPicture.network(weather.weatherStateImageUrl,
                height: _imageSize, width: _imageSize),
            SizedBox(height: Paddings.linePadding),
            Text('$minTemp / $maxTemp', textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
