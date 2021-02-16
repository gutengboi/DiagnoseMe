import 'package:diagnose_me/models/AilmentModel.dart';
import 'package:flutter/material.dart';

import 'selectScreen.dart';

class AilmentScreen extends StatefulWidget {
  final List<AilmentModel> model;
  AilmentScreen({this.model});

  @override
  _AilmentScreenState createState() => _AilmentScreenState();
}

class _AilmentScreenState extends State<AilmentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        "Hi Arbeeorlar",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text("Preview the Ailments:",
                    style: TextStyle(color: Colors.white, fontSize: 17)),
              ),
              SizedBox(
                height: 20,
              ),
              for (var item in widget.model) pill(index: 0, item: item),
            ],
          ),
        ),
      ),
    );
  }

  Widget pill({int index, AilmentModel item, VoidCallback onPressed}) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(top: 10, right: 10),
      child: ButtonTheme(
        minWidth: 56,
        child: RaisedButton(
          onPressed: onPressed ?? () {},
          elevation: 0,
          color: item.changeColor ? Colors.deepOrange : Colors.white,
          // color: _pillIndex == index ? Colors.green : Colors.white,
          // textColor: _pillIndex == index ? Colors.white : Colors.black,
          textColor: item.changeColor ? Colors.white : Colors.black,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.yellowAccent),
          ),
          child: Text(
            item.title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'Source Sans Pro'),
          ),
        ),
      ),
    );
  }
}
