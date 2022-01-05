import 'package:flutter/material.dart';
import 'package:flutter_app_shade6/global_variables.dart';
import 'package:flutter_app_shade6/components/textfield_border_container.dart';


class SquareInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final int maxlength;
  final int minlength;
  const SquareInputField({
    required this.hintText,
    required this.icon ,
    required this.onChanged,
    required this.textInputType,
    required this.maxlength,
    required this.minlength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldBorderContainer(

      child: TextField(
        keyboardType: textInputType == ""? TextInputType.text: textInputType,
        maxLength: maxlength == null? null: maxlength,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          labelText: hintText,
          counterStyle: TextStyle(height: double.minPositive, fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'OpenSans' ),
          counterText:"" ,
          icon: Icon(
              icon,
              color: Primary_Green),


          //hintText: hintText ,
          hintStyle: TextStyle(height: double.minPositive, color: Colors.black, fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
