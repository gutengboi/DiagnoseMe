import 'package:flutter/material.dart';

class SuccessDialog extends StatefulWidget {
  final Widget child;

  SuccessDialog(this.child);

  @override
  State<StatefulWidget> createState() => _SuccessDialog();

  static Future<void> show(BuildContext context, Widget child,
      {bool barrierDismissible = true}) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return SuccessDialog(child);
        },
        barrierDismissible: barrierDismissible);

    /*await showGeneralDialog(context: context, pageBuilder: (context, anim, secondaryAnim) {
      return Container(child: Text("Be Like I will display as a card view, That will be very long and will make all things available for all"),);
    });*/
  }
}

class _SuccessDialog extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: widget.child,
    );

    /*return  Material(
      child: ,
    );*/
  }
}
