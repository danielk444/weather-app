import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/providers/settings_provider.dart';
import 'package:weather_app/utils/unit_conversion_utils.dart';
import 'package:provider/provider.dart';

class WeatherImageWidget extends StatelessWidget {
  final Weather weather;

  WeatherImageWidget({required this.weather});

  final _animationDuration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.orientation == Orientation.portrait
        ? mediaQuery.size.width / 3
        : mediaQuery.size.height / 3;

    return Column(
      children: [
        Text(weather.weatherStateName,
            style: const TextStyle(fontSize: FontSize.subtitle)),
        SizedBox(height: Paddings.linePadding),
        AnimatedSwitcher(
          duration: _animationDuration,
          child: SvgPicture.network(weather.weatherStateImageUrl,
              key: Key(weather.weatherStateImageUrl),
              fit: BoxFit.contain,
              height: size,
              width: size),
        ),
        SizedBox(height: Paddings.linePadding),
        Consumer<SettingsProvider>(builder: (context, settings, child) {
          return Text(
              UnitConversionUtils.formatTemperature(
                  celsius: weather.theTemp, isCelsius: settings.isCelsius),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: FontSize.h3, fontWeight: FontWeight.bold));
        }),
      ],
    );
  }
}
