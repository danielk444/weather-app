import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/extensions/date_time_extension.dart';
import 'package:weather_app/ui/weather/cubit/weather_cubit.dart';
import 'package:weather_app/ui/widgets/common/pull_to_refresh_widget.dart';
import 'package:weather_app/ui/widgets/weather/weather_day_list_widget.dart';
import 'package:weather_app/ui/widgets/weather/weather_details_widget.dart';
import 'package:weather_app/ui/widgets/weather/weather_image_widget.dart';

class WeatherPage extends StatelessWidget {
  final int selectedDayIndex;
  final List<Weather> weather;

  WeatherPage({required this.selectedDayIndex, required this.weather});

  Widget build(BuildContext context) {
    final selectedDayWeather = weather[selectedDayIndex];
    return PullToRefreshWidget(
      onRefresh: () {
        final completer = Completer();
        final weatherCubit = BlocProvider.of<WeatherCubit>(context);
            weatherCubit.refreshWeather(completer);
        return completer.future;
      },
      child: OrientationBuilder(builder: (context, orientation) {
        return Padding(
          padding: const EdgeInsets.all(Paddings.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(selectedDayWeather.applicableDate.fullDay(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: FontSize.h4)),
              SizedBox(height: Paddings.linePadding),
              orientation == Orientation.portrait
                  ? _buildPortrait(selectedDayWeather)
                  : _buildLandscape(selectedDayWeather)
            ],
          ),
        );
      }),
    );
  }

  Widget _buildPortrait(Weather selectedDayWeather) {
    return Expanded(
      child: Column(
        children: [
          WeatherImageWidget(weather: selectedDayWeather),
          SizedBox(height: Paddings.linePadding),
          WeatherDetailsWidget(weather: selectedDayWeather),
          Expanded(child: Container()),
          WeatherDayListWidget(weather: weather)
        ],
      ),
    );
  }

  Widget _buildLandscape(Weather selectedDayWeather) {
    return Expanded(
      child: Row(
        children: [
          WeatherImageWidget(weather: selectedDayWeather),
          SizedBox(width: Paddings.horizontalLinePadding),
          WeatherDetailsWidget(weather: selectedDayWeather),
          Expanded(child: Container()),
          WeatherDayListWidget(weather: weather, direction: Axis.vertical)
        ],
      ),
    );
  }
}
