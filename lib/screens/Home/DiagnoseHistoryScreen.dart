import 'dart:convert';

import 'package:diagnose_me/core/model/diagnose.dart';
import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:diagnose_me/core/util/Constant.dart';
import 'package:diagnose_me/core/util/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class DiagnoseHistoryScreen extends StatefulWidget {
  @override
  _DiagnoseHistoryScreenState createState() => _DiagnoseHistoryScreenState();
}

class _DiagnoseHistoryScreenState extends State<DiagnoseHistoryScreen> {
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
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text("See the History of your Diagnose",
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
                  height: 20,
                ),
                Container(height: 80, child: setListView2()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget testKitCard(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: IconButton(
                    icon: Icon(Icons.sick),
                    color: Colors.amberAccent,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Text(
                            "Diagnose",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Text(
                              "Perform your covid 19 testing by filling the test kit and get instant result",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 9)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                )
              ],
            )),
      ),
    );
  }

  //final dataList = await DBHelper.getData('user_places');

  List<ResponseString> getData() {
    List<Answer> answers;
    List<ResponseString> responseString;
    var histories = DBProvider.db.queryAllRows();
    Iterable i;
    if (histories != null) {
      print(":::::${histories.toString()}");
      histories.then((value) {
        i = value;
      });
      responseString =
          i.map((model) => ResponseString.fromJson(model)).toList();
      return responseString;
    } else {
      return responseString = null;
    }
  }

  Widget setListView2() {
    return getData().length > 0
        ? Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: getData().length,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {}, child: testKitCard(context));
              },
            ),
          )
        : Container();
  }

  Widget setListView() {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return testKitCard(
              context); //InkWell(onTap: () {}, child: menuRow(index));
        },
      ),
    );
  }
}
