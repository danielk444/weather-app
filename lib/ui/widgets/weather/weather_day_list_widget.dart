import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/ui/weather/cubit/weather_cubit.dart';
import 'package:weather_app/ui/widgets/weather/weather_day_list_tile_widget.dart';

class WeatherDayListWidget extends StatelessWidget {
  final List<Weather> weather;
  final Axis direction;

  WeatherDayListWidget(
      {required this.weather,
      this.direction = Axis.horizontal});

  final _itemSpacing = 10.0;

  Widget _buildList(BuildContext context, int index) {
    final currentIndexWeather = weather[index];
    return GestureDetector(
      onTap: () => _onDayListTileTapped(context, index),
      child: WeatherListDayTileWidget(
          weather: currentIndexWeather),
    );
  }

  _onDayListTileTapped(BuildContext context, int index) {
    BlocProvider.of<WeatherCubit>(context).onDaySelected(index);
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return SizedBox(
        width: direction == Axis.horizontal ? _itemSpacing : null,
        height: direction == Axis.vertical ? _itemSpacing : null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: direction == Axis.horizontal
          ? WeatherListDayTileWidget.tileSize
          : null,
      width:
          direction == Axis.vertical ? WeatherListDayTileWidget.tileSize : null,
      child: ListView.separated(
          separatorBuilder: _separatorBuilder,
          shrinkWrap: true,
          scrollDirection: direction,
          itemCount: weather.length,
          itemBuilder: _buildList),
    );
  }
}
