import 'dart:async';
import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:flutter/material.dart';

class DialogLoading extends StatefulWidget {
  final BuildContext context;
  final Widget subtitle;
  final Duration duration;

  DialogLoading({this.subtitle, this.context, this.duration});

  @override
  _DialogLoadingState createState() => _DialogLoadingState();
}

class _DialogLoadingState extends State<DialogLoading>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // _controller =
    //     AnimationController(duration: Duration(seconds: 5), vsync: this)
    //       ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build12(BuildContext context) {
    if (widget.duration != null && this.widget.context != null) {
      // we use the parent context to close the dialog
      Timer(widget.duration, () {
        Navigator.of(this.widget.context, rootNavigator: true).pop();
      });
    }

    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.70),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          ),
          this.widget.subtitle ?? Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.duration != null && this.widget.context != null) {
      // we use the parent context to close the dialog
      Timer(widget.duration, () {
        Navigator.of(this.widget.context, rootNavigator: true).pop();
      });
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.70),
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 170,
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          Expanded(
//            child: AnimatedContainer(
//              height: double.infinity,
//              width: double.infinity,
//              duration: Duration(seconds: 5),
//              curve: Curves.fastOutSlowIn,
//              child: Container(
//                margin: EdgeInsets.only(right: 13, left: 13),
//                alignment: Alignment.center,
//                child: Image(
//                  image: AssetImage(
//                    "images/icon.png",
//                  ),
//                  width: 60,
//                  height: 60,
//                ),
//              ),
//            ),
//          ),
          Expanded(
            child: RotationTransition(
              turns: _controller,
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  "images/icon.png",
                ),
                width: 60,
                height: 60,
              ),
            ),
          ),
          this.widget.subtitle ?? Container(),
        ],
      ),
    );
  }
}
