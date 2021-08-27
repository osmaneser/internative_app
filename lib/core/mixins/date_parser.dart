import 'package:intl/intl.dart';

mixin DateFormatterMixin {
  String dateFormatter(DateTime date) => DateFormat.yMd('tr').format(date);
}
