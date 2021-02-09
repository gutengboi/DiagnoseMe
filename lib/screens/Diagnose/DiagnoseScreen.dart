import 'dart:async';

import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:diagnose_me/models/AilmentModel.dart';
import 'package:diagnose_me/screens/Diagnose/DiagnoseScreen.dart';
import 'package:flutter/material.dart';

import '../ailmentScreen.dart';

class DiagnoseScreen extends StatefulWidget {
  @override
  _DiagnoseScreenState createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen> {
  TextEditingController emailController = TextEditingController();

  List<String> lst = ['android', 'kotlin', 'flutter'];
  int selectedIndex = 0;
  int _pillIndex = 0;
  bool changeColor = false;
  List<IconData> iconlist = [
    Icons.settings,
    Icons.bookmark,
    Icons.account_circle
  ];
  int secondaryIndex = 0;
  // var title = ["Fever (High Temperature)","Headache","Nausea","Frequent Stooling","","","","","","","","","","","","","","","","","","","","","","","","","","",]

  List<AilmentModel> counterList = List<AilmentModel>();

  @override
  void initState() {
    super.initState();

    counterList.clear();
  }

  @override
  Widget build(BuildContext context) {
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
                            // Container(
                            //   width: 40,
                            //   height: 40,
                            //   margin: EdgeInsets.all(5),
                            //   child: CircleAvatar(
                            //     radius: 20.0,
                            //     backgroundImage: AssetImage("images/dp.png"),
                            //   ),
                            // ),
                          ],
                        ),
                      )
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
                  child: Text("Select the ailment you are suffering from.",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Expanded(
                          child: Wrap(
                            children: <Widget>[
                              for (var item in ailmentItem)
                                pill(index: 0, item: item),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  //  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AilmentScreen(model: counterList)));
                    },
                    elevation: 0,
                    color: Colors.purple,
                    textColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.yellowAccent),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Source Sans Pro'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  displayTestKitScreen() async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DiagnoseScreen()));
  }

  displayMap() async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DiagnoseScreen()));
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return OutlineButton(
      onPressed: () => changeIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide:
          BorderSide(color: selectedIndex == index ? Colors.cyan : Colors.grey),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex == index ? Colors.cyan : Colors.grey),
      ),
    );
  }

  void changeSecondaryIndex(int index) {
    setState(() {
      secondaryIndex = index;
    });
  }

  Widget customRadio2(IconData icon, int index) {
    return OutlineButton(
      onPressed: () => changeSecondaryIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide: BorderSide(
          color: secondaryIndex == index ? Colors.purple : Colors.grey),
      child: Icon(icon,
          color: secondaryIndex == index ? Colors.purple : Colors.grey),
    );
  }

  Widget pill({int index, AilmentModel item, VoidCallback onPressed}) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(top: 10, right: 10),
      child: ButtonTheme(
        minWidth: 56,
        child: RaisedButton(
          onPressed: onPressed ??
              () {
                if (counterList.length < 10) {
                  setState(() {
                    item.changeColor = !item.changeColor;
                  });
                  if (item.changeColor) {
                    counterList.add(item);
                  } else {
                    if (counterList.length > 0) {
                      counterList.remove(item);
                    }
                  }
                } else {
                  print("counterlist ${counterList.length}");
                  var _item =
                      counterList.firstWhere((element) => element == item);
                  if (_item != null) {
                    setState(() {
                      item.changeColor = !_item.changeColor;
                    });
                  }
                  counterList.remove(item);
                }
              },
          elevation: 0,
          color: item.changeColor ? Colors.purple : Colors.white,
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
