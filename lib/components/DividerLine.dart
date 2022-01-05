import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {

  DividerLine() ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: Divider(
          height: 1,
          thickness: 1,
          indent: 20,
          endIndent: 0,
          color: Colors.black,
        )
    );
  }
}

