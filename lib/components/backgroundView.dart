import 'package:flutter/material.dart';

class backgroundView extends StatefulWidget {
  String backgroundImages;

  backgroundView({this.backgroundImages});

  @override
  _backgroundViewState createState() =>
      _backgroundViewState(backgroundImages: backgroundImages);
}

class _backgroundViewState extends State<backgroundView> {
  final String backgroundImages;

  _backgroundViewState({this.backgroundImages});



  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      //width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImages), // ;imageDirectory[0]),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}


class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        backgroundView(backgroundImages: "images/lgbackImage.png"),
        backgroundView(backgroundImages: "images/login_overlay.png"),
        backgroundView(backgroundImages: "images/Background.png"),
      ],
    );
  }
}