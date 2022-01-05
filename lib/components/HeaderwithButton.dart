import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_shade6/components/RoundedButton.dart';

class HeaderwithButton extends StatelessWidget {

  final String title;
  final String subtitle;
  final String buttonText;

  HeaderwithButton(this.title, this.subtitle, this.buttonText) ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
        child: Container(
          height: 70,
          child: ListTile(
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(subtitle),
                RoundedButton(text: buttonText, color: Colors.orange, textColor: Colors.white, buttonWidth: 150,buttonHeight: 40 ),
              ],
            ),
          ),
        )
    );
  }
}

