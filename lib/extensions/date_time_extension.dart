import 'package:intl/intl.dart';

extension Formatter on DateTime {
  static final _fullDayFormat = DateFormat('EEEE');
  static final _dayAbbrFormat = DateFormat('E');

  String fullDay() {
    return _fullDayFormat.format(this);
  }

  String dayAbbr() {
    return _dayAbbrFormat.format(this);
  }
}
