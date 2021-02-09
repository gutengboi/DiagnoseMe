import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  BaseAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _BaseAppBarState createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            //padding: EdgeInsets.only(top: 20,bottom: 20,),
            child: IconButton(
              iconSize: 24,
              icon: Icon(Icons.arrow_back_ios),
              color: AppColors.white,
              onPressed: () => Navigator.of(context).pop(true),
            ),
          );
        },
      ),
      actions: <Widget>[
//        Container(
//          margin: EdgeInsets.only(right: 13, left: 13),
//          height: 20,
//          width: 20,
//          decoration: BoxDecoration(
//              borderRadius: BorderRadius.all(Radius.circular(20)),
//              color: AppColors.primary),
//          child: null,
//        ),
      ],
    );
  }
}

class PopAppBar extends StatefulWidget implements PreferredSizeWidget {
  PopAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _PopAppBarState createState() => _PopAppBarState();
}

class _PopAppBarState extends State<PopAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
              icon: Icon(Icons.close),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              }); //
        },
      ),
    );
  }
}

class BaseAppBarWithoutBackButton extends StatefulWidget
    implements PreferredSizeWidget {
  BaseAppBarWithoutBackButton({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _BaseAppBarWithoutBackButtonState createState() =>
      _BaseAppBarWithoutBackButtonState();
}

class _BaseAppBarWithoutBackButtonState
    extends State<BaseAppBarWithoutBackButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 13, left: 13),
            height: 40,
            width: 40,
            child: Transform.scale(
              scale: 1,
              child: IconButton(
                  icon: Image.asset(
                "images/R2.png",
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarWidget({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Builder(
        builder: (BuildContext context) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pop(true);
            },
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              //padding: EdgeInsets.only(top: 20,bottom: 20,),
              child: IconButton(
                iconSize: 30,
                icon: Icon(Icons.keyboard_backspace),
                color: AppColors.primary,
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ),
          ); //
        },
      ),
    );
  }
}

class DashboardAppWidget extends StatefulWidget implements PreferredSizeWidget {
  DashboardAppWidget({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _DashboardAppWidgetState createState() => _DashboardAppWidgetState();
}

class _DashboardAppWidgetState extends State<DashboardAppWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Builder(
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage("images/dp.png"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Color(0xFF2C6C2B),
                        ),
                        child: Text(
                          "ISOLA ABEEB ABIOLA",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text("Property Owner",
                            style: TextStyle(color: Colors.white, fontSize: 9)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: IconButton(
                    icon: Icon(Icons.notifications),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
