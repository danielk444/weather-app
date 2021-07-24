import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/strings.dart';

class TemperatureUnitSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);
    final buttonText =
        settings.isCelsius ? Strings.celsiusSymbol : Strings.fahrenheitSymbol;
    return Padding(
      padding: const EdgeInsets.all(Paddings.buttonPadding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: CircleBorder(),
        ),
        child: Text(buttonText,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        onPressed: () {
          settings.changeTemperatureUnit();
        },
      ),
    );
  }
}
