import 'package:flutter/material.dart';
import 'package:internative_app/core/mixins/date_parser.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with DateFormatterMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            child: Text(dateFormatter(DateTime(2021, 02, 03))),
          ),
        ),
      ),
    );
  }
}
