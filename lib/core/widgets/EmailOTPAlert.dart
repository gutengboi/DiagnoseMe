import 'dart:async';

import 'package:covtrack/core/themes/AppColors.dart';
import 'package:covtrack/core/widgets/GeneralWidgets.dart';
import 'package:covtrack/data/network/ApiError.dart';
import 'package:covtrack/ui/dashbaord/screen/dashboard.dart';
import 'package:covtrack/ui/onboarding/bloc/OnboardingBloc.dart';
import 'package:covtrack/ui/onboarding/screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppBar.dart';

class EmailOTPAlert extends StatefulWidget {
  final String message;
  final String authorizationToken;
  final String email;
  //final Function(BuildContext, String, String) onClicked;

  EmailOTPAlert({
    this.message,
    this.authorizationToken,
    this.email,
    //this.onClicked,
  });

  @override
  _EmailOTPAlertState createState() => _EmailOTPAlertState();
}

class _EmailOTPAlertState extends State<EmailOTPAlert> with GeneralWidgets {
  OnboardingBloc bloc;
  @override
  void initState() {
    super.initState();
    // loadData();
  }

  moveToDashboard() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Dashboard()));
  }

//  Future<Timer> loadData() async {
//    return new Timer(Duration(seconds: 5),
//        widget.onClicked(context, widget.authorizationToken, widget.email));
//  }

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<OnboardingBloc>(context, listen: false);
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: PopAppBar(),
          backgroundColor: AppColors.white,
          body: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Container(
                      child: Image.asset("images/Mail.png"),
//                color: Colors.green,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                    child: Text(
                      "Check you Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D2029),
                        fontSize: 25.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      widget.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 200,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                //side: BorderSide(color: Colors.red)
                              ),
                              onPressed: () {
                                moveToOTPScreen(context,
                                    widget.authorizationToken, widget.email);
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  moveToOTPScreen(
      BuildContext context, String authorizationToken, String email) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => OTPScreen(
            onVerified: onOTPVerified,
            email: email,
            authorizationToken: authorizationToken),
      ),
    );
  }

  onOTPVerified(
      BuildContext context, String pinEnter, String authorizationToken) {
    showLoading(context);
    bloc.doTokenVrification(pinEnter, authorizationToken).then((value) {
      Navigator.of(context, rootNavigator: true).pop();
      if (value.responseObject != null) {
        if (value.responseObject.code == "0000") {
          moveToDashboard();
        } else {
          showError(context,
              title: "Failed", message: "${value.responseObject.message}");
        }
      } else {
        showError(context, title: "Failed", message: "${value.errorMessage}");
      }
    }).catchError((onError) {
      Navigator.of(context, rootNavigator: true).pop();
      showError(context,
          title: "Failed",
          message: "${ApiError.fromDio(onError).errorDescription}");
    });
  }
}
