import 'package:diagnose_me/slide/splashScreen.dart';
import 'package:flutter/material.dart';

import 'core/themes/AppColors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static Color primary = Color(0xFF0093D6);
  static Color primary12 = Color(0xFF4347A0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiagnoseMe',
      theme: ThemeData(
          //primarySwatch: Color(0xFF0093D6),
          primaryColor: Color(0xFF0093D6),
          accentColor: Color(0xFF0093D6),
          buttonTheme: ButtonThemeData(
            height: 44.0,
            buttonColor: AppColors.primary,
            textTheme: ButtonTextTheme.primary,
          ),
          textTheme: TextTheme(
            body2: TextStyle(
              fontSize: 16.0,
            ),
          )),
      home: SplashScreen(),
    );
  }
}
