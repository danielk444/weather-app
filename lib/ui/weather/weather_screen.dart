import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/di/inject.dart';
import 'package:weather_app/strings.dart';
import 'package:weather_app/ui/weather/cubit/weather_cubit.dart';
import 'package:weather_app/ui/weather/weather_page.dart';
import 'package:weather_app/ui/weather/error_page.dart';
import 'package:weather_app/ui/widgets/common/loading_widget.dart';
import 'package:weather_app/ui/widgets/common/temperature_unit_switch.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final Duration _errorSnackBarDuration = const Duration(days: 365);

  Widget _build(BuildContext context, WeatherState state) {
    if (state is WeatherLoading) {
      return LoadingWidget();
    } else if (state is WeatherDisplay) {
      return WeatherPage(
          selectedDayIndex: state.selectedDayIndex, weather: state.weather);
    } else if (state is WeatherReloading) {
      return Container();
    } else if (state is WeatherError) {
      return ErrorPage(
          text: state.errorMessage,
          onRetry: () {
            BlocProvider.of<WeatherCubit>(context).retryFetchWeather();
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          });
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.weatherScreenTitle),
        actions: [TemperatureUnitSwitch()],
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<WeatherCubit>(),
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: _build,
          ),
        ),
      ),
    );
  }
}
