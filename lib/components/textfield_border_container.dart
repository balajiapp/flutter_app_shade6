import 'package:flutter/material.dart';
import 'package:flutter_app_shade6/global_variables.dart';

class TextFieldBorderContainer extends StatelessWidget {
  final Widget child;
  const TextFieldBorderContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        //color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Primary_Green)
      ),
      child: child,
    );
  }
}
