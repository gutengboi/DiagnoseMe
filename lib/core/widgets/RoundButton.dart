import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundButton extends StatelessWidget {

   String text;
  Color backgroundColor;
  double radius;
  Alignment alignment;
  double width;
  double buttonHeight;
  EdgeInsetsGeometry margin;
  EdgeInsetsGeometry padding;
  double  elevation ;
  FontWeight textFontWeight;
  Color textColor;
  double textSize;
  Function onClick;
  Function onLongPress;
  Color  textBackColor;

  

  RoundButton(
      {@required this.text,
      @required this.backgroundColor,
      @required this.radius, 
      @required this.width,
      @required this.buttonHeight,
      @required this.margin,
      @required this.alignment,
      @required this.elevation,
      @required this.textFontWeight,
      @required this.textColor,
      @required this.textSize, 
      @required  this.onClick,
      this.padding,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      padding: padding,
      margin: margin,
      alignment: alignment, // Alignment.centerRight,
      child: Material(
          elevation: elevation ,
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor,
          child: MaterialButton(
            minWidth: width,
            height: buttonHeight,
            onPressed: onClick,
            child: Text(
              
              text,
              style:
                  TextStyle(fontWeight: textFontWeight, fontSize: textSize, fontFamily: 'Source Sans Pro', color: textColor),
            ),
          )),
    );
  }
}
