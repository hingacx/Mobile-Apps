import 'package:flutter/material.dart';

import '../screens/main_screen.dart';

// Nothing of interest here other than setting the font and theme of the app
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoSlab',
      ),
      home: const MainScreen(),
    );
  }
}
