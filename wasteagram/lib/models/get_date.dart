import 'package:intl/intl.dart';

// Simple function that returns the current date as a string
String getCurrentDate() {
  final formatter = DateFormat.yMMMMEEEEd();
  final currentDate = DateTime.now();
  return formatter.format(currentDate);
}

// Gets the time stamp and returns a int, used to sort the posts
int getTimeStamp() {
  final time = DateTime.now().microsecondsSinceEpoch;
  return time;
}
