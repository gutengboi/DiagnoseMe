import 'package:covtrack/core/themes/AppColors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static of(BuildContext context) {
    return AppStyles();
  }

  static DecorationImage backgroundDecorationImage({String imagePath}) {
    return DecorationImage(
      colorFilter:
          ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop),
      image: AssetImage(
        imagePath ?? "images/background-mobile.png",
      ),
      fit: BoxFit.cover,
    );
  }

  static TextStyle boldText(BuildContext context) {
    return Theme.of(context).textTheme.body1.copyWith(
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle semiBoldText(BuildContext context) {
    return Theme.of(context).textTheme.body1.copyWith(
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle textTitle(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle onBoardingTitle(BuildContext context) {
    return Theme.of(context).textTheme.headline.copyWith(
          fontWeight: FontWeight.w600,
        );
  }

  static BoxDecoration inputField({bool hasError = false}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: hasError ? Border.all(color: Colors.red) : null,
      color: Colors.grey.shade200,
    );
  }

  static Widget formSpace() {
    return SizedBox(height: 20);
  }

  static Widget formSectionSpace() {
    return SizedBox(height: 40);
  }

  static TextStyle commonTextStyle(
      {BuildContext context,
      bool boldOrNormal,
      double fontSize,
      Color fontColor}) {
    return Theme.of(context).textTheme.body1.copyWith(
          fontWeight: boldOrNormal ? FontWeight.normal : FontWeight.bold,
          fontFamily: 'Source Sans Pro',
          fontSize: fontSize,
          color: Color.fromRGBO(0, 0, 0, 0.64),
        );
  }

  static TextStyle bottomText(BuildContext context, bool isActive) {
    return Theme.of(context).textTheme.body1.copyWith(
          fontWeight: FontWeight.normal,
          fontFamily: 'Source Sans Pro',
          fontSize: 12,
          color:
              isActive ? AppColors.primary : Color.fromRGBO(255, 255, 255, 0.5),
        );
  }
}
