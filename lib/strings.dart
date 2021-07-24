abstract class Strings {
  static final appTitle = 'Weather app';
  static final weatherScreenTitle = 'Weather app';
  static final fetchWeatherErrorMessage = 'Error fetching weather';
  static final buttonRetry = 'Retry';
  static final buttonDismiss = 'Dismiss';
  static final celsiusSymbol = '\u2103';
  static final fahrenheitSymbol = '\u2109';

  static humidity(String humidity) => 'Humidity: $humidity %';
  static pressure(String pressure) => 'Pressure: $pressure hpa';
  static wind(String wind) => 'Wind: $wind km/h';
}
