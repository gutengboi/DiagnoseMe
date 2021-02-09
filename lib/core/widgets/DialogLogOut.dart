import 'package:diagnose_me/core/themes/AppColors.dart';
import 'package:flutter/material.dart';

class DialogLogOut extends StatelessWidget {
  DialogLogOut();

  static show(BuildContext context) {
    showDialog(
      context: context,
      builder: (contex) {
        return DialogLogOut();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 300,
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Sign out from Covtrac?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    borderSide: BorderSide(color: AppColors.primary),
                    child: Text("Cancel"),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Text("Sign out"),
                  ),
                ),
                // Expanded(
                //   child: FlatButton(
                //     //elevation: 0,
                //     //color: AppColors.primary.withOpacity(0.6),
                //     onPressed: () {
                //       Navigator.of(context, rootNavigator: true).pop();
                //     },
                //     child: Text(
                //       "Cancel",
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 25,
                // ),
                // Expanded(
                //   child: RaisedButton(
                //     elevation: 0,
                //     color: AppColors.primary.withOpacity(0.6),
                //     onPressed: () {
                //       Navigator.of(context, rootNavigator: true).pop();
                //     },
                //     child: Text(
                //       "Sign out",
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void navigateUserToSplashScreen(BuildContext context) {
    //Navigator.of(context).pushNamed(NavigatorManager.initial);
  }
}
