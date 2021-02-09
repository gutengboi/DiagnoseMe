import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:diagnose_me/screens/selectScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:diagnose_me/components/uiMenuModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 8;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 150;
    var _aspectRatio = _width / cellHeight;
    return new Scaffold(
        backgroundColor: Colors.black38,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(
                top: 10.0,
                left: 24.0,
                right: 24.0,
              ),
              width: 550,
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.deepOrange,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Health Tips For Today',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    Text('Twice', style: TextStyle(color: Colors.white))
                    // ButtonTheme.bar(
                    //   child: ButtonBar(
                    //     children: [
                    //       FlatButton(
                    //         child: const Text('Edit', style: TextStyle(color: Colors.white)),
                    //         onPressed: () {},
                    //       ),
                    //       FlatButton(
                    //         child: const Text('Delete', style: TextStyle(color: Colors.white)),
                    //         onPressed: () {},
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 25, bottom: 10),
                      child: Text("What are you looking for?",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary))),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: _crossAxisCount,
                        childAspectRatio: _aspectRatio,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 30.0,
                      ),
                      itemCount: menuItem.length,
                      itemBuilder: (context, index) {
                        return menus(menuItem[index]);
                      },
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ]),
        ));
  }

  Widget menus(UiMenuModel menuItem) {
    return InkWell(
      onTap: () {
        if (menuItem.subtitle.toLowerCase().contains("diagnostics")) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SelectScreen()));
        } else if (menuItem.subtitle.toLowerCase().contains("history")) {
        } else if (menuItem.subtitle.toLowerCase().contains("hospitals")) {
        } else if (menuItem.subtitle.toLowerCase().contains("pharmacy")) {}
      },
      child: Container(
        child: Card(
          margin: EdgeInsets.only(left: 10, right: 10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          color: menuItem.itemColor,
          //alignment: Alignment.center,
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 49,
                  height: 49,
                  alignment: Alignment.center,
                  child: Image(
                    image: menuItem.icon,
                    width: 49,
                    height: 49,
                  ),
                ),
                Container(
                  color: menuItem.itemColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("${menuItem.subtitle}",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      Text("${menuItem.title}",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 11,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
