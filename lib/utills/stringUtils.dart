import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

String dayAndTimeFormat(DateTime date) {
  if (date != null && date != '') {
    initializeDateFormatting();
    final tanggal = DateFormat('EEEE, d MMMM yyyy', 'en_US');
    final String formatTanggal = tanggal.format(date);
    return formatTanggal;
  } else {
    return date.toString();
  }
}
