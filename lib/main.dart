import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/auth/sign_in/sign_in_page.dart';
import 'package:internative_app/ui/modules/home/home_view_model.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';

import 'core/theme/theme_data.dart';
import 'ui/modules/profile/profile_detail/profile_detail_view_model.dart';
import 'ui/modules/user/user_view_model.dart';

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
    return RestartWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getThemeFromThemeMode(),
        home: SignInPage(),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    
    locator<HomeViewModel>().dispose();
    locator<ProfileDetailViewModel>().dispose();
    locator<UserViewModel>().dispose();

    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
