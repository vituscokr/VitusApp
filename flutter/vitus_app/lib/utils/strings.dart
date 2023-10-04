import 'package:intl/intl.dart';

String getNumberFormat(int result) {
  return NumberFormat('###,###,###,###').format(result);
}