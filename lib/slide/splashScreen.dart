import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagnose_me/slide/slide.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.blueGrey;
  final TextStyle styleTextUnderTheLoader = TextStyle(
    fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  final splashDelay = 7000;
  @override
  void initState(){
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(milliseconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => WalkThroughScreen()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.black38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/dia.png',
                      height: 200,
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                  ],
                )),
            ),
            // Expanded(
            //   child: Column(
            //     children: [
            //       CircularProgressIndicator(),
            //
            //       Container(
            //         height: 10,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Spacer(
            //             flex: 4,
            //           ),
            //           Text('androing'),
            //           Spacer(),
            //         ],
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
