import 'package:flutter/material.dart';

class BackgroundView extends StatefulWidget {
  @override
  _BackgroundViewState createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      //width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.png"), // ;imageDirectory[0]),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class BgScreen extends StatelessWidget {
  final String imageString;

  BgScreen({this.imageString});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      //width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageString), // ;imageDirectory[0]),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
