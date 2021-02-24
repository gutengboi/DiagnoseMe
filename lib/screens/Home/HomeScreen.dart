import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:diagnose_me/core/model/diagnose.dart';
import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:diagnose_me/screens/Diagnose/DiagnoseScreen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();

  var menuText = ["Diagnose History", "Hospitals", "Pharmarcy"];
  var menuLogo = ["images/map.png", "images/3191932.png", "images/route.png"];

  PageController _pageController = PageController();
  Timer autoScrollTimer;
  int activeSlide = 0;

  List<Answer> answer = List<Answer>();

//  Future displayCountry() async {
//    await Navigator.of(context)
//        .push(MaterialPageRoute(builder: (context) => CountryScreen()))
//        .then((value) {});
//  }

  // displayTestKitScreen() async {
  //   await Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => TestKitScreen()));
  // }
  //
  // displayMap() async {
  //   await Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => MappingScreen()));
  // }

  @override
  void initState() {
    super.initState();
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
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                  "Lets pass your info to the administrator!",
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
                  height: 40,
                ),
                corvidInfoCard(),
                SizedBox(
                  height: 40,
                ),
                testKitCard(context),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 0),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: IconButton(
                          icon: Icon(Icons.access_time_outlined),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      Text(
                        "Menu",
                        style: TextStyle(
                            color: Colors.white, //Color(0xFF747474),
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(height: 80, child: setListView2()),
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

  Widget corvidInfoCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      margin: EdgeInsets.only(left: 18, right: 18, top: 0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
        boxShadow: [
          new BoxShadow(
            color: Colors.black26, // Color(0x1A2D2D2D),
            blurRadius: 7.0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.0),
        ),
        elevation: 5,
        margin: EdgeInsets.zero,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Monday Health Tips",
                  style: TextStyle(
                      color: AppColors.primary15,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Testing Testing Testing"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: IconButton(
                        icon: Icon(Icons.play_circle_fill_outlined),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: IconButton(
                        icon: Icon(Icons.play_circle_fill_outlined),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget testKitCard(BuildContext context) {
    return InkWell(
      onTap: () {
        openDiagnoseDialog(context);
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
                            "Diagnose",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(
                        //     horizontal: 5,
                        //   ),
                        //   child: Text(
                        //       "Perform your covid 19 testing by filling the test kit and get instant result",
                        //       style:
                        //           TextStyle(color: Colors.white, fontSize: 9)),
                        // )
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

  Widget setListView2() {
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menuText.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                if (index == 0) {}
              },
              child: menuRow(index));
        },
      ),
    );
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

  Widget menuRow(int i) {
    return Container(
      width: 150,
      height: 40,
      margin: EdgeInsets.only(left: 18, right: 18, top: 0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: Card(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          elevation: 8,
          margin: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: AppColors.primary,
                  backgroundImage: AssetImage(
                    "${menuLogo[i]}",
                  ),
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
                          "${menuText[i]}",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  displayTestKitScreen() async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DiagnoseScreen()));
  }

  displayDiagnoseScreen() async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DiagnoseScreen()));
  }

//   Widget termAndConditon(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Dialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
//           child: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//             return Container(
//               height: MediaQuery.of(context).size.height,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     alignment: Alignment.topRight,
//                     child: IconButton(
//                         icon: Icon(Icons.close),
//                         color: Colors.black,
//                         onPressed: () {
//                           Navigator.pop(context, false);
//                         }),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(right: 20, left: 20),
//                     child: Text(
//                       "Kindly Answer the Question below with Yes or No.",
//                       style: TextStyle(fontSize: 15),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.center,
//                       margin: EdgeInsets.only(left: 10, right: 10),
//                       child: DottedBorder(
//                         dashPattern: [6, 3, 2, 3],
//                         padding: EdgeInsets.all(4),
//                         borderType: BorderType.RRect,
//                         child: Container(
//                           alignment: Alignment.center,
//                           height: 170,
//                           child: Text(
//                             "$question",
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 7),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Expanded(
//                         child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.only(
//                             left: 30.0,
//                             right: 10.0,
//                             top: 30,
//                             bottom: 20,
//                           ),
//                           child: FlatButton(
//                             onPressed: () async {
//                               int random =
//                                   Random().nextInt(symptomsItems.length);
//                               String questionItems =
//                                   symptomsItems.elementAt(random).symptomsName;
//                               setState(() {
//                                 questionCounter++;
//                                 question = questionItems;
//                               });
//                             },
//                             child: Text(
//                               "YES",
//                             ),
//                             color: AppColors.primary,
//                             textColor: Colors.white,
// //                      shape: RoundedRectangleBorder(
// //                        borderRadius: BorderRadius.circular(6.0),
// //                      ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           width: double.infinity,
//                           padding: EdgeInsets.only(
//                             left: 10.0,
//                             right: 30.0,
//                             top: 30,
//                             bottom: 20,
//                           ),
//                           child: FlatButton(
//                             onPressed: () async {
//                               int random =
//                                   Random().nextInt(symptomsItems.length);
//                               //questionCounter =  random  ;
//                               String questionItems =
//                                   symptomsItems.elementAt(random).symptomsName;
//                               setState(() {
//                                 questionCounter++;
//                                 question = questionItems;
//                               });
//                             },
//                             child: Text(
//                               "NO",
//                             ),
//                             color: AppColors.accent,
//                             textColor: Colors.white,
// //                      shape: RoundedRectangleBorder(
// //                        borderRadius: BorderRadius.circular(6.0),
// //                      ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           })),
//     );
//   }

  openDiagnoseDialog(
    BuildContext context,
  ) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        SYMPTOM symptoms = SYMPTOM();
        String question = "Start";

        int random = Random().nextInt(symptomsItems.length);
        symptoms = symptomsItems.elementAt(random);

        String questionItems = symptoms.symptomsName;
        question = questionItems;
        print("::::::::::$questionItems::::::::::::::");
        print("::::::::::$random::::::::::::::");
        print("::::::::::${symptomsItems.length}::::::::::::::");

        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: Icon(Icons.close),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pop(context, false);
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20, left: 20),
                        child: Text(
                          "Kindly Answer the Question below with Yes or No.",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: DottedBorder(
                            dashPattern: [6, 3, 2, 3],
                            padding: EdgeInsets.all(4),
                            borderType: BorderType.RRect,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  alignment: Alignment.center,
                                  height: 170,
                                  child: Text(
                                    "Do you suffer from $question",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 30.0,
                                right: 10.0,
                                top: 30,
                                bottom: 20,
                              ),
                              child: FlatButton(
                                onPressed: () async {
                                  Answer newAnswer = Answer(
                                      ailmentId: symptoms.ailmentid,
                                      symptomId: symptoms.id,
                                      answer: true);
                                  answer.add(newAnswer);
                                  print(
                                      "::::::::RANDOM:::::::::::$random:::::::::RANDOM::::::::");
                                  random++;

                                  // if (random > symptomsItems.length) {
                                  //   setState(() {
                                  //     random--;
                                  //   });
                                  // }

                                  setState(() {
                                    symptoms = symptomsItems
                                        .where((element) =>
                                            element.ailmentid ==
                                            symptoms.ailmentid)
                                        .elementAt(random);

                                    //symptoms = symptomsItems.elementAt(questionCounter);

                                    question = symptoms.symptomsName;
                                  });
                                },
                                child: Text(
                                  "YES",
                                ),
                                color: AppColors.primary,
                                textColor: Colors.white,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(6.0),
//                      ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 10.0,
                                right: 30.0,
                                top: 30,
                                bottom: 20,
                              ),
                              child: FlatButton(
                                onPressed: () async {
                                  Answer newAnswer = Answer(
                                      ailmentId: symptoms.ailmentid,
                                      symptomId: symptoms.id,
                                      answer: false);
                                  answer.add(newAnswer);

                                  random++;
                                  print(
                                      "::::::::RANDOM:::::::::::$random:::::::::RANDOM::::::::");

                                  // if (random > symptomsItems.length) {
                                  //   setState(() {
                                  //     random--;
                                  //   });
                                  // }

                                  setState(() {
                                    symptoms = symptomsItems
                                        .where((element) =>
                                            element.ailmentid ==
                                            symptoms.ailmentid)
                                        .elementAt(random);

                                    //symptoms = symptomsItems.elementAt(questionCounter);
                                    question = symptoms.symptomsName;
                                  });
                                },
                                child: Text(
                                  "NO",
                                ),
                                color: AppColors.accent,
                                textColor: Colors.white,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(6.0),
//                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }));
        });
      },
    );
  }
}
