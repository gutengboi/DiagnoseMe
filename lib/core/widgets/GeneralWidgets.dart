import 'package:covtrack/core/themes/AppColors.dart';
import 'package:covtrack/core/themes/AppStyles.dart';
import 'package:covtrack/core/widgets/progressindicator.dart';
import 'package:flutter/material.dart';

import 'DialogLoading.dart';
import 'SuccessDialog.dart';
//import 'package:workmanager/workmanager.dart';

class GeneralWidgets {
//  void showApiError(BuildContext context, ApiError apiError, {Map<String, dynamic> arguments}) {
//    switch(apiError.error.HasError) {
//      case ApiErrorCodes.SESSION_TIMEOUT:
//        //DialogSessionTimeout.show(context, message: apiError.errorDescription);
//        break;
//      case ApiErrorCodes.EXISTING_PROFILE:
//       // DialogExistingProfile.show(context, message: apiError.errorDescription);
//        break;
//      case ApiErrorCodes.EXISTING_ACCOUNT:
//        //DialogExistingCustomer.show(context, message: apiError.errorDescription, arguments: arguments);
//        break;
//      default:
//        showError(context, title: "Failed", message: apiError.errorDescription);
//        break;
//    }
//  }

  void showError(BuildContext context,
      {bool barrierDismissible = true,
      String title,
      String message,
      String buttonText = "CLOSE",
      VoidCallback onButtonTapped,
      VoidCallback errorInfoTapped}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.formError),
                ),
              ),
              /*InkWell(
                  onTap: () {
                    GlobalErrorViewScreen.open(context);
                  },
                  child: Icon(Icons.info_outline, color: Colors.red.shade200,),
                ),*/
            ],
          ),
          content: Text(
            message ?? "",
            style: TextStyle(color: AppColors.primary),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                if (onButtonTapped != null) onButtonTapped();
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  void showConfirmDialog(BuildContext context,
      {String title,
      String message,
      String positiveText = "Confirm",
      VoidCallback onPositiveTapped}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.formError),
                ),
              ),
            ],
          ),
          content: Text(
            message ?? "",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text("Close"),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  onPositiveTapped();
                },
                child: Text(positiveText),
              ),
            ),
          ],
        );
      },
    );
  }

  showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, {String message}) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message ?? ""),
      backgroundColor: Colors.orange,
    ));
  }

//  logout(BuildContext context) async {
//    // Navigator.of(context, rootNavigator: true).pop();
////    Workmanager.cancelAll();
//    await Navigator.of(context).pushAndRemoveUntil(
//        MaterialPageRoute(builder: (context) => LoginScreen()), (
//        Route<dynamic> route) => false);
//  }
//
  showSuccessDialog1(BuildContext context, String message, {Function onClick}) {
    SuccessDialog.show(
      context,
      successDialogContent(context, message, onClick),
      barrierDismissible: false,
    );
  }

  Widget successDialogContent(
      BuildContext context, String message, Function onClick) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Done!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Source Sans Pro',
              )),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.center,
            child: Text(message != null ? message : "Ok",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontFamily: 'Source Sans Pro',
                )),
          ),
          SizedBox(height: 17),
          Container(
            width: double.infinity,
            height: 38,
            margin: EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
            child: RaisedButton(
              elevation: 0,
              onPressed: onClick ??
                  () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
              child: Text("Ok"),
            ),
          ),
        ],
      ),
    );
  }

  showProgressDialog(BuildContext context, GlobalKey _scaffoldKey) async {
    await showDialog(
        context: context,
        builder: (context) {
          return ProgressIndicatorPrimary();
        });
  }

  // TODO (Lekan): We need a better way to display loading widget & states
  void showLoading(BuildContext context, {bool close = false, String message}) {
    if (close) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      SuccessDialog.show(
        context,
        WillPopScope(
          onWillPop: () async => false,
          child: DialogLoading(
            subtitle: Container(
              child: Text(
                "",
                style: AppStyles.semiBoldText(context),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }
  }
}
