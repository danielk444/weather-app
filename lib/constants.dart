const String weatherApiBaseUrl = 'https://www.metaweather.com';
const String fetchWeatherUrl = '/api/location/523920/';

const int displayPrecisionDigits = 0;

abstract class Paddings {
  static const double buttonPadding = 4;
  static const double pagePadding = 20;
  static const double linePadding = 10;
  static const double horizontalLinePadding = 40;
}

abstract class FontSize {
  static const double subtitle = 16;
  static const double h6 = 20;
  static const double h4 = 34;
  static const double h3 = 48;
}