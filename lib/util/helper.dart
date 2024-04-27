
import 'package:easy_localization/easy_localization.dart';

String formatDate(String date) {
  return DateFormat('MMM dd, yyyy').format(DateTime.parse(date));
}

String getDayAndMonthName(String date) {
  // Convert the input date to a DateTime object
  DateTime dateObj = DateTime.parse(date);

  // Get the name of the day (e.g., Monday, Tuesday, etc.)
  String dayName = DateFormat.EEEE().format(dateObj);
  String day = DateFormat.d().format(dateObj);
  print(day);
  // Get the name of the month (e.g., January, February, etc.)
  String monthName = DateFormat.MMMM().format(dateObj);

  // Concatenate the day name and month name
  return "$day,$dayName,$monthName";
}
