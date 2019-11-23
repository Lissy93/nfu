import 'package:intl/intl.dart';

/// Returns the number of days between now, and a given DateTime
int makeDayCountFromDate(DateTime targetStart) {
  return (new DateTime.now()).difference(targetStart).inDays;
}

/// Returns a human readable date, from a given timestamp
String makeReadableDateFromDate(int timestamp) {
  final date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
  final dateFormat = new DateFormat('d MMMM yy');
  return dateFormat.format(date);
}