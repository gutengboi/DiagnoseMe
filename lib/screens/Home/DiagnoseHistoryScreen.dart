import 'dart:convert';

import 'package:diagnose_me/core/model/diagnose.dart';
import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:diagnose_me/core/util/Constant.dart';
import 'package:diagnose_me/core/util/DatabaseHelper.dart';
import 'package:flutter/material.dart';

import 'TestResultScreen.dart';

class DiagnoseHistoryScreen extends StatefulWidget {
  @override
  _DiagnoseHistoryScreenState createState() => _DiagnoseHistoryScreenState();
}

class _DiagnoseHistoryScreenState extends State<DiagnoseHistoryScreen> {
  List<String> responseObj = List();
  List<ResponseString> respObjString = List<ResponseString>();
  @override
  void initState() {
    super.initState();

    DBProvider.db.queryAllRows().then((value) {
      responseObj = value;
    });
    for (int i = 1; i < responseObj.length; i++) {
      ResponseString responseString =
          ResponseString.fromJson(jsonDecode(responseObj[i]));
      print("$i");
      print(":::initState:::${responseString.toJson()}");
      respObjString.add(responseString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        backgroundColor: AppColors.primary15,
        body: Container(
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
              Expanded(child: setListView2()),
            ],
          ),
        ),
      ),
    );
  }

  Widget testKitCard(BuildContext context, List<Answer> answer) {
    //  int id = answer.first.ailmentId;
    //AILMENT ailment = ailmentItems.where((element) => element.id == id).single;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TestResultScreen(
                      response: answer,
                      donotInsert: true,
                    )));
      },
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
                            "ailment.ailmentName",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Text("------",
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

  // Future<List<ResponseString>> getData() async {
  //   List<ResponseString> responseString = List();
  //   responseString = await DBProvider.db.queryAllRows();
  //   print("::::snapshot:::::${responseString.toList().length}:");
  //   return responseString;
  // }

  getExistingUserProfile() async {
    List<ResponseString1> responseString = List<ResponseString1>();
    var userData = await DBProvider.db.queryAllRows();
    Iterable i = userData;
    //Iterable i = userData['result'];
    print("get2FAResponseObject  ${jsonEncode(userData)}");
    return userData;
    // if (userData.length > 0) {
    //   ResponseString1 resp = ResponseString1.fromJson(userData);
    //
    //   print("get2FAResponseObject  ${resp.toJson()}");
    //
    //   // List<ResponseString> tagObjs =
    //   //     userData.map((tagJson) => ResponseString.fromJson(tagJson)).toList();
    //   print("${jsonEncode(resp)}");
    //   return resp;
    // } else {
    //   return null;
    // }
  }

  // UserDetail _userDetail = UserDetail();
  // User _user;
  // try {
  // List<Map<String, dynamic>> userData =
  // await DBProvider.db.queryAllRows(Constant.PROFILE_TABLE);
  // if (userData.length > 0) {
  // _user = User.fromJson(userData.last);

  Widget setListView2() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DBProvider.db.queryAllRowsInTheTable(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          print("::response::::${snapshot.data.length}::::response::");
          return Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print(
                    "::responseJSON::::${jsonEncode(snapshot.data[index]['responseJSON'])}::::responseJSON::");
                var jsonDecodeObj =
                    jsonDecode(snapshot.data[index]['responseJSON']);
                ResponseString string = ResponseString.fromJson(jsonDecodeObj);

                return InkWell(onTap: () {}, child: testKitCard(context, null));
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  // Widget setListView() {
  //   return Container(
  //     child: ListView.builder(
  //       itemCount: 10,
  //       itemBuilder: (context, index) {
  //         return testKitCard(
  //             context); //InkWell(onTap: () {}, child: menuRow(index));
  //       },
  //     ),
  //   );
  // }
}
