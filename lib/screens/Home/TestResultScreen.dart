import 'dart:convert';

import 'package:blinking_text/blinking_text.dart';
import 'package:diagnose_me/core/model/diagnose.dart';
import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:diagnose_me/core/util/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class TestResultScreen extends StatefulWidget {
  final List<Answer> response;
  final bool donotInsert;
  TestResultScreen({this.response, this.donotInsert = false});

  @override
  _TestResultScreenState createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.donotInsert == false) {
      ResponseString responseString =
          ResponseString(responseJSON: widget.response);
      var resp = DBProvider.db.rawInsert(responseString);
    }
  }

  @override
  Widget build(BuildContext context) {
    int id = widget.response.first.ailmentId;
    AILMENT ailment = ailmentItems.where((element) => element.id == id).single;

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        backgroundColor: AppColors.primary15,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
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
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text("Your Test Result Below!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 9)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(5),
                              child: IconButton(
                                icon: Icon(Icons.notifications),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(5),
                              child: CircleAvatar(
                                radius: 20.0,
                                child: IconButton(
                                  icon: Icon(Icons.account_box_outlined),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                corvidInfoCard(ailment),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Text("CLOSE",
                        style: TextStyle(
                            fontFamily: 'SourceSansPro', color: Colors.red)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget keyValueLabel(String key, String value) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "$key",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Source Sans Pro'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "$value",
                //textAlign: TextAlign.right,
                style: TextStyle(
                    color: AppColors.primary15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget corvidInfoCard(AILMENT ailment) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 480,
      margin: EdgeInsets.only(left: 18, right: 18, top: 0),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(11.0), color: Colors.white),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                "The Answered Questions :",
                style: TextStyle(
                    color: AppColors.primary15,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            for (var t in widget.response)
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 20,
                      child:
                          keyValueLabel(t.question, t.answer ? "YES" : "NO")),
                ],
              ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Suggested Ailment:",
                style: TextStyle(
                    color: AppColors.primary15,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ),
            testKitCard(context, ailment),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    showInfoDialog(context,
                        title: "Cause", message: "${ailment.causeName}");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Cause",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13.0,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showInfoDialog(context,
                        title: "Treatment", message: "${ailment.treatment}");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 10,
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Treatment",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13.0,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showInfoDialog(context,
                        title: "Dosage", message: "${ailment.dosage}");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 10,
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Dosage",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13.0,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showInfoDialog(context,
                        title: "Prevention", message: "${ailment.prevention}");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 10,
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Prevention",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13.0,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future showInfoDialog(
    BuildContext context, {
    bool barrierDismissible = true,
    String title,
    String message,
    String buttonText = "CLOSE",
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'SourceSansPro'),
                ),
              ),
            ],
          ),
          content: Text(
            message ?? "",
            style: TextStyle(fontFamily: 'SourceSansPro'),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(buttonText,
                  style: TextStyle(fontFamily: 'SourceSansPro')),
            ),
          ],
        );
      },
    );
  }

  Widget testKitCard(BuildContext context, AILMENT ailment) {
    return InkWell(
      onTap: () {},
      child: Container(
        // width: MediaQuery.of(context).size.width,
        height: 65,
        margin: EdgeInsets.only(left: 18, right: 18, bottom: 15),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
        ),
        child: Card(
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
            elevation: 8,
            margin: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: BlinkText(
                    "${ailment.ailmentName}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                    beginColor: Colors.white,
                    endColor: Colors.orange,
                    duration: Duration(seconds: 1),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  getAilmentById() {
    int id = widget.response.first.ailmentId;
    AILMENT ailment = ailmentItems.where((element) => element.id == id).single;
    return ailment;
  }
}
