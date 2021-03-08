import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:diagnose_me/core/model/diagnose.dart';
import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:diagnose_me/screens/Diagnose/DiagnoseScreen.dart';
import 'package:diagnose_me/screens/Home/DiagnoseHistoryScreen.dart';
import 'package:diagnose_me/screens/Home/TestResultScreen.dart';
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
  List<bool> negative = List<bool>();
  List<bool> positive = List<bool>();
  double positiveWeight = 0.0;
  double negativeWeight = 0.0;
  String QuoteOfTheday = "Quote of the day";
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
  var oneSec = const Duration(seconds: 5);
  int counter = 0;
  @override
  void initState() {
    super.initState();
    new Timer.periodic(oneSec, (Timer t) {
      int rand = Random().nextInt(symptomsItems.length);
      counter++;

      setState(() {
        if (counter > healthTips.length) {
          counter = 0;
        }
        QuoteOfTheday = healthTips[counter];
      });
    });
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

  String getDay(int day) {
    if (day == 7) {
      return "Sunday";
    } else if (day == 1) {
      return "Monday";
    } else if (day == 2) {
      return "Tuesday";
    } else if (day == 3) {
      return "Wednesday";
    } else if (day == 4) {
      return "Thursday";
    } else if (day == 5) {
      return "Friday";
    } else if (day == 6) {
      return "Saturday";
    } else {
      return "Saturday";
    }
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
                  "${getDay(DateTime.now().weekday)} Health Tips",
                  style: TextStyle(
                      color: AppColors.primary15,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ),

              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text("$QuoteOfTheday",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primary15,
                            fontWeight: FontWeight.bold))),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   alignment: Alignment.bottomCenter,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         margin: EdgeInsets.all(5),
              //         child: IconButton(
              //           icon: Icon(Icons.play_circle_fill_outlined),
              //           color: Colors.white,
              //           onPressed: () {},
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Container(
              //         margin: EdgeInsets.all(5),
              //         child: IconButton(
              //           icon: Icon(Icons.play_circle_fill_outlined),
              //           color: Colors.white,
              //           onPressed: () {},
              //         ),
              //       ),
              //     ],
              //   ),
              // )
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
                if (index == 0) {
                  displayDiagnoseHistoryScreen();
                }
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

  displayDiagnoseHistoryScreen() async {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DiagnoseHistoryScreen()));
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
                              answer.clear();
                              symptoms = null;

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
                                  print(
                                      "::::::::RANDOM:::::::::::$random:::::::::RANDOM::::::::");
                                  random++;

                                  List<SYMPTOM> _symptoms = symptomsItems
                                      .where((element) =>
                                          element.ailmentid ==
                                          symptoms.ailmentid)
                                      .toList();

                                  if (random > _symptoms.length) {
                                    setState(() {
                                      random = 1;
                                    });
                                  }

                                  print(
                                      "::::::::SYMPTOM:::::::::::${symptoms.id}:::::::::SYMPTOM::::::::");
                                  print(
                                      "::::::::COUNT SYMPTOM:::::::::::${_symptoms.length}:::::::::SYMPTOM::::::::");
                                  print(
                                      "::::::::SECOND RANDOM:::::::::::$random:::::::::RANDOM::::::::");
                                  if (random < _symptoms.length) {
                                    setState(() {
                                      symptoms = _symptoms.elementAt(random);
                                      question = symptoms.symptomsName;
                                      // .elementAt(random) ??
                                      //null;
                                      //symptoms = symptomsItems.elementAt(questionCounter);
                                    });
                                    Answer newAnswer = Answer(
                                        ailmentId: symptoms.ailmentid,
                                        symptomId: symptoms.id,
                                        weight: symptoms.weight,
                                        answer: true,
                                        question: question);
                                    answer.add(newAnswer);
                                  } else {
                                    print(
                                        "::::::_symptoms::::${_symptoms.length}:::F::::::");
                                    print(
                                        ":::::answer:::::${answer.length}:::::G::::");
                                    if (answer.length >= _symptoms.length) {
                                    } else if (answer.length ==
                                        _symptoms.length) {
                                      print(":::::I AM INSIDE 1");
                                      for (var i in answer) {
                                        if (i.answer) {
                                          positiveWeight += i.weight;
                                          positive.add(i.answer);
                                        } else {
                                          negativeWeight += i.weight;
                                          negative.add(i.answer);
                                        }
                                      }
                                      if (positive.length == negative.length) {
                                        print(":::::I AM INSIDE NEGATIVE");
                                        setState(() {
                                          answer.clear();
                                          int random = Random()
                                              .nextInt(symptomsItems.length);
                                          symptoms =
                                              symptomsItems.elementAt(random);
                                          String questionItems =
                                              symptoms.symptomsName;
                                          question = questionItems;
                                        });
                                      } else if (positiveWeight ==
                                          negativeWeight) {
                                        print(":::::I AM INSIDE WEIGHT");
                                        setState(() {
                                          answer.clear();
                                          int random = Random()
                                              .nextInt(symptomsItems.length);
                                          symptoms =
                                              symptomsItems.elementAt(random);
                                          String questionItems =
                                              symptoms.symptomsName;
                                          question = questionItems;
                                        });
                                      } else {
                                        print(":::::LAST BUST STOP");
                                        if (positiveWeight > negativeWeight) {
                                          //Decide result
                                          print(
                                              ":::::1::::$positiveWeight::::2:::::");
                                          print(
                                              ":::::3:::::$negativeWeight::::4:::::");
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TestResultScreen(
                                                        response: answer,
                                                      )));
                                        } else if (positive.length >
                                            negative.length) {
                                          //Decide result

                                          print(
                                              ":::::11::::${positive.length}::::22:::::");
                                          print(
                                              ":::::33:::::${negative.length}::::44:::::");
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TestResultScreen(
                                                        response: answer,
                                                      )));
                                        } else {
                                          print("::::KOLEYEWON:::");
                                        }
                                      }
                                    } else {
                                      for (var i in answer) {
                                        if (i.answer) {
                                          positiveWeight += i.weight;
                                          positive.add(i.answer);
                                        } else {
                                          negativeWeight += i.weight;
                                          negative.add(i.answer);
                                        }
                                      }
                                      if (positive.length == negative.length) {
                                        print(":::::I AM INSIDE NEGATIVE");
                                        setState(() {
                                          answer.clear();
                                          int random = Random()
                                              .nextInt(symptomsItems.length);
                                          symptoms =
                                              symptomsItems.elementAt(random);
                                          String questionItems =
                                              symptoms.symptomsName;
                                          question = questionItems;
                                        });
                                      } else if (positiveWeight ==
                                          negativeWeight) {
                                        print(":::::I AM INSIDE WEIGHT");
                                        setState(() {
                                          answer.clear();
                                          int random = Random()
                                              .nextInt(symptomsItems.length);
                                          symptoms =
                                              symptomsItems.elementAt(random);
                                          String questionItems =
                                              symptoms.symptomsName;
                                          question = questionItems;
                                        });
                                      } else {
                                        print(":::::LAST BUST STOP");
                                        if (positiveWeight > negativeWeight) {
                                          //Decide result
                                          print(
                                              ":::::1::::$positiveWeight::::2:::::");
                                          print(
                                              ":::::3:::::$negativeWeight::::4:::::");
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TestResultScreen(
                                                        response: answer,
                                                      )));
                                        } else if (positive.length >
                                            negative.length) {
                                          //Decide result

                                          print(
                                              ":::::11::::${positive.length}::::22:::::");
                                          print(
                                              ":::::33:::::${negative.length}::::44:::::");
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TestResultScreen(
                                                        response: answer,
                                                      )));
                                        } else {
                                          print("::::KOLEYEWON:::");
                                        }
                                      }
                                    }
                                  }
                                },
                                child: Text(
                                  "YES",
                                ),
                                color: AppColors.primary,
                                textColor: Colors.white,
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
                                  random++;
                                  List<SYMPTOM> _symptoms = symptomsItems
                                      .where((element) =>
                                          element.ailmentid ==
                                          symptoms.ailmentid)
                                      .toList();

                                  if (random > _symptoms.length) {
                                    setState(() {
                                      random = 1;
                                    });
                                  }
                                  if (random < _symptoms.length) {
                                    setState(() {
                                      symptoms = _symptoms.elementAt(random);
                                      question = symptoms.symptomsName;
                                      // .elementAt(random) ??
                                      //null;
                                      //symptoms = symptomsItems.elementAt(questionCounter);
                                    });
                                    Answer newAnswer = Answer(
                                        ailmentId: symptoms.ailmentid,
                                        symptomId: symptoms.id,
                                        weight: symptoms.weight,
                                        answer: false,
                                        question: question);
                                    answer.add(newAnswer);
                                  } else {
                                    print(
                                        "::::::_symptoms::::${_symptoms.length}:::F::::::");
                                    print(
                                        ":::::answer:::::${answer.length}:::::G::::");
                                    if (answer.length >= _symptoms.length) {
                                    } else if (answer.length ==
                                        _symptoms.length) {
                                      print(":::::I AM INSIDE 1");
                                      for (var i in answer) {
                                        if (i.answer) {
                                          positiveWeight += i.weight;
                                          positive.add(true);
                                        } else {
                                          negativeWeight += i.weight;
                                          negative.add(false);
                                        }
                                      }
                                      if (positive.length == negative.length) {
                                        print(":::::I AM INSIDE NEGATIVE");
                                        setState(() {
                                          answer.clear();
                                          int random = Random()
                                              .nextInt(symptomsItems.length);
                                          symptoms =
                                              symptomsItems.elementAt(random);
                                          String questionItems =
                                              symptoms.symptomsName;
                                          question = questionItems;
                                        });
                                      } else if (positiveWeight ==
                                          negativeWeight) {
                                        print(":::::I AM INSIDE WEIGHT");
                                        setState(() {
                                          answer.clear();
                                          int random = Random()
                                              .nextInt(symptomsItems.length);
                                          symptoms =
                                              symptomsItems.elementAt(random);
                                          String questionItems =
                                              symptoms.symptomsName;
                                          question = questionItems;
                                        });
                                      } else {
                                        print(":::::LAST BUST STOP");
                                        if (positiveWeight > negativeWeight) {
                                          //Decide result
                                          print(
                                              ":::::1::::$positiveWeight::::2:::::");
                                          print(
                                              ":::::3:::::$negativeWeight::::4:::::");
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TestResultScreen(
                                                        response: answer,
                                                      )));
                                        } else if (positive.length >
                                            negative.length) {
                                          //Decide result

                                          print(
                                              ":::::11::::${positive.length}::::22:::::");
                                          print(
                                              ":::::33:::::${negative.length}::::44:::::");
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TestResultScreen(
                                                        response: answer,
                                                      )));
                                        } else {
                                          print("::::KOLEYEWON:::");
                                          // setState(() {
                                          //   answer.clear();
                                          //   int random = Random()
                                          //       .nextInt(symptomsItems.length);
                                          //   symptoms =
                                          //       symptomsItems.elementAt(random);
                                          //   String questionItems =
                                          //       symptoms.symptomsName;
                                          //   question = questionItems;
                                          // });
                                        }
                                      }
                                    } else {
                                      for (var i in answer) {
                                        if (i.answer) {
                                          positiveWeight += i.weight;
                                          positive.add(i.answer);
                                        } else {
                                          negativeWeight += i.weight;
                                          negative.add(i.answer);
                                        }
                                      }
                                      if (positive.length == negative.length) {
                                        print(":::::I AM INSIDE NEGATIVE");
                                        setState(() {
                                          answer.clear();
                                          int random = Random()
                                              .nextInt(symptomsItems.length);
                                          symptoms =
                                              symptomsItems.elementAt(random);
                                          String questionItems =
                                              symptoms.symptomsName;
                                          question = questionItems;
                                        });
                                      } else if (positiveWeight ==
                                          negativeWeight) {
                                        print(":::::I AM INSIDE WEIGHT");
                                        setState(() {
                                          answer.clear();
                                          int random = Random()
                                              .nextInt(symptomsItems.length);
                                          symptoms =
                                              symptomsItems.elementAt(random);
                                          String questionItems =
                                              symptoms.symptomsName;
                                          question = questionItems;
                                        });
                                      } else {
                                        print(":::::LAST BUST STOP");
                                        if (positiveWeight > negativeWeight) {
                                          //Decide result
                                          print(
                                              ":::::1::::$positiveWeight::::2:::::");
                                          print(
                                              ":::::3:::::$negativeWeight::::4:::::");
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TestResultScreen(
                                                        response: answer,
                                                      )));
                                        } else if (positive.length >
                                            negative.length) {
                                          //Decide result

                                          print(
                                              ":::::11::::${positive.length}::::22:::::");
                                          print(
                                              ":::::33:::::${negative.length}::::44:::::");
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TestResultScreen(
                                                        response: answer,
                                                      )));
                                        } else {
                                          print("::::KOLEYEWON:::");
                                          // setState(() {
                                          //   answer.clear();
                                          //   int random = Random()
                                          //       .nextInt(symptomsItems.length);
                                          //   symptoms =
                                          //       symptomsItems.elementAt(random);
                                          //   String questionItems =
                                          //       symptoms.symptomsName;
                                          //   question = questionItems;
                                          // });
                                        }
                                      }
                                    }
                                  }
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
