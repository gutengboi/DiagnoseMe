import 'package:covtrack/core/themes/AppColors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorPrimary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var brightness = MediaQuery
//        .of(context)
//        .platformBrightness == Brightness.light;
//    ;
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(AppColors.white),
        ),
      ),
      backgroundColor: AppColors.primary.withOpacity(
          0.70), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
    );
  }
}
