import 'package:flutter/material.dart';
import 'package:internative_app/init/locator.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'ui/modules/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("tr_TR", null);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
