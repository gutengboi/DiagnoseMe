import 'package:flutter/material.dart';
import 'package:diagnose_me/screens/login_page.dart';
import 'dart:async';
import 'package:diagnose_me/components/appColor.dart';
import 'package:diagnose_me/components/backgroundView.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  var scaffoldKey = GlobalKey();
  int _currentPage = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey3 = GlobalKey<ScaffoldState>();

  moveToLanding() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  Widget build(BuildContext context) {
    double screenSizeHeight = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          body: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: <Widget>[
                  PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          this._currentPage = page;
                        });
                      },
                      children: <Widget>[
                        firstScreen(context),
                        secondScreen(context),
                        thirdScreen(context)
                      ]),
//                  Container(
//                    alignment: Alignment.bottomCenter,
//                    margin:
//                        EdgeInsets.only(top: (screenSizeHeight * 0.60) + 30),
//                    // margin: EdgeInsets.only(left: 25, right: 30),
//                    child: pageViewDots(
//                      context,
//                      3,
//                      activeIndex: this._currentPage,
//                      onClick: moveToLanding,
//                    ),
//                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget firstScreen(BuildContext context) {
    double screenSizeHeight = MediaQuery
        .of(context)
        .size
        .height;
    //  double  screenSizeWidth = MediaQuery.of(context).size.width ;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        key: _scaffoldKey1,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            backgroundView(backgroundImages: "assets/image/pir.jpeg"),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   color: AppColors.primary.withOpacity(0.7),
            // ),

            Container(
                margin: EdgeInsets.only(top: (screenSizeHeight * 0.60)),
                // margin: EdgeInsets.only(left:50),
                height: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25),
                          child: Text("Made for",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ))),
                      SizedBox(height: 10),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25),
                          child: Text("K12",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white))),
                      SizedBox(height: 12),
                      Container(
                        // alignment: Alignment.centerLeft,
                          width: 251,
                          margin: EdgeInsets.only(left: 25),
                          child: Text(
                              "Safe digital learning platform for basic education with web collaboration	tools for pupils, parents and teachers.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.white.withOpacity(0.8)))),
                      SizedBox(height: 30),
                      pageViewDots(context, true, false, false,
                          onClick: moveToLanding),
                    ])),
          ],
        ),
      ),
    );
  }

  Widget secondScreen(BuildContext context) {
    double screenSizeHeight = MediaQuery
        .of(context)
        .size
        .height;
    //  double  screenSizeWidth = MediaQuery.of(context).size.width ;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        key: _scaffoldKey2,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            backgroundView(backgroundImages: "assets/image/pie.jpeg"),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   color: AppColors.primary.withOpacity(0.78),
            // ),
            Container(
                margin: EdgeInsets.only(top: (screenSizeHeight * 0.60)),
                // margin: EdgeInsets.only(left:50),
                height: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25),
                          child: Text("Made for",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ))),
                      SizedBox(height: 10),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25),
                          child: Text("Higher Education",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white))),
                      SizedBox(height: 12),
                      Container(
                        // alignment: Alignment.centerLeft,
                          width: 251,
                          margin: EdgeInsets.only(left: 25),
                          child: Text(
                              "Learning and Administration for Tertiary institutions delivering educational contents with improved student engagement.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.white.withOpacity(0.80)))),
                      SizedBox(height: 30),
                      pageViewDots(context, false, true, false,
                          onClick: moveToLanding),
                    ])),
          ],
        ),
      ),
    );
  }

  Widget thirdScreen(BuildContext context) {
    double screenSizeHeight = MediaQuery
        .of(context)
        .size
        .height;
    //  double  screenSizeWidth = MediaQuery.of(context).size.width ;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        key: _scaffoldKey3,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            backgroundView(backgroundImages: "assets/image/pis.jpeg"),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   color: AppColors.primary.withOpacity(0.7),
            // ),
            Container(
                margin: EdgeInsets.only(top: (screenSizeHeight * 0.60)),
                // margin: EdgeInsets.only(left:50),
                height: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25),
                          child: Text("Made for",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ))),
                      SizedBox(height: 10),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 25),
                          child: Text("Organization",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white))),
                      SizedBox(height: 12),
                      Container(
                        // alignment: Alignment.centerLeft,
                          width: 251,
                          margin: EdgeInsets.only(left: 25),
                          child: Text(
                              "Training compliance and certification tools for professionals development and improved employee productivity",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.white.withOpacity(0.8)))),
                      SizedBox(height: 30),
                      pageViewDots(context, false, false, true,
                          onClick: moveToLanding),
                    ])),
          ],
        ),
      ),
    );
  }

  Widget pageViewDots(BuildContext context, bool dotCount1, bool dotCount2,
      bool dotCount3,
      {int activeIndex, Function onClick}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                width: 20.0,
                height: 3.0,
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                color: dotCount1 ? AppColors.white : AppColors.grey),
            Container(
                width: 20.0,
                height: 3.0,
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                color: dotCount2 ? AppColors.white : AppColors.grey),
            Container(
                width: 20.0,
                height: 3.0,
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                color: dotCount3 ? AppColors.white : AppColors.grey),
          ]),
          dotCount3
              ? InkWell(
            onTap: onClick,
            child: Container(
              child: Text("Continue",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white)),
            ),
          )
              : InkWell(
            onTap: onClick,
            child: Container(
              child: Text("Skip",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget dotWidget(int index, int activeIndex) {
    return Container(
        width: 20.0,
        height: 3.0,
        margin: EdgeInsets.symmetric(horizontal: 3.0),
        color: activeIndex != null && index == activeIndex
            ? AppColors.white
            : AppColors.grey);
  }
}