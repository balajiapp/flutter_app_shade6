import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color, textColor;
  double buttonWidth;
  double buttonHeight;

  RoundedButton({
    //required Key key,
    required this.text,
    this.onPressed,
    required this.color,
    required this.textColor ,
    required this.buttonWidth,
    required this.buttonHeight,
  }) ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Colors.orange,
            Colors.orangeAccent,
          ],
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: buttonWidth,
      height: buttonHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          /*color: color,*/
          onPressed: onPressed ,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
