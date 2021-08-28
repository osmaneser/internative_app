import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internative_app/core/configs/global_constants.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/auth/sign_in/sign_in_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';

import 'ui/modules/home/home_page.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("tr_TR", null);
  setupLocator();

  final tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  Hive.init(tempPath);

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
    GlobalConstants.navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      navigatorKey: GlobalConstants.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
