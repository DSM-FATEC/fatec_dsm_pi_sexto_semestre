import 'package:intl/intl.dart';

class DateUtils {
  static String format(String? date) {
    if (date == null || date == '') {
      return '';
    }

    return DateFormat('dd/MM/yyyy hh:mm').format(DateTime.parse(date));
  }
}