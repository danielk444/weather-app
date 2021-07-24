import 'package:flutter/material.dart';
import 'package:weather_app/di/inject.dart';
import 'package:weather_app/providers/settings_provider.dart';
import 'package:weather_app/strings.dart';
import 'package:weather_app/ui/weather/weather_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        accentColor: Colors.black,
      ),
      home: ChangeNotifierProvider(
          create: (context) => getIt<SettingsProvider>(),
          child: WeatherScreen()),
    );
  }
}
