import 'dart:core';
import 'package:intl/intl.dart';

class CommonFunctions {
 static String  rupeeFormatandSymbol( num amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }
}