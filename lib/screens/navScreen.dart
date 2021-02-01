import 'package:flutter/material.dart';
import 'package:diagnose_me/screens/home.dart';
import 'package:diagnose_me/screens/selectScreen.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  var screens = [
    HomeScreen(),
    Container(
      child: Center(child: Text("Test")),
    )

  ];

  var scaffoldKey  =  GlobalKey<ScaffoldState>();
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: () async {
          return  false;
        },
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black38,
            appBar: AppBar(
              backgroundColor: Colors.black38,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black38,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.white),
                    title: Text("Home")
                ),

                // BottomNavigationBarItem(
                //     icon: Icon(Icons.person, color: Colors.white),
                //     title: Text("Profile")
                // ),


                BottomNavigationBarItem(
                    icon: Icon(Icons.settings, color: Colors.white),
                    title: Text("Settings",style: TextStyle(color: Colors.blue),)
                ),
              ],
              onTap: (index){
                setState(() {
                  selectedTab = index;
                });
              },
              showUnselectedLabels: true,
              iconSize: 25,
            ),
            body: Container(
                margin: EdgeInsets.only(top: 5),
                child: screens[selectedTab])
//              body: PageStorage(bucket: pageStorageBucket, child: _children[_currentIndex]),
        ),
      ),
    );
  }
}