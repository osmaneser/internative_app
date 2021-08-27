import 'package:flutter/material.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/auth/sign_in/sign_in_page.dart';
import 'package:internative_app/ui/reusuable_widgets/profile_card/profile_card.dart';

import 'core/services/dialog_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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


class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            OeProfileCard(userId: "",name: "Osman", email: "osmaneser@gmail.com", imgUrl: "https://www.vhv.rs/dpng/d/276-2761771_transparent-avatar-png-vector-avatar-icon-png-png.png"),
          ],
        ),
      )
    );
  }
}