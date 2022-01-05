import 'package:flutter/material.dart';
import 'package:flutter_app_shade6/global_variables.dart';
import 'package:flutter_app_shade6/components/text_field_container.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final int maxlength;
  final int minlength;
  final bool isObscure;

  const RoundedInputField({

    required this.hintText,
    required this.icon ,
    required this.onChanged,
    required this.textInputType,
    required this.maxlength,
    required this.minlength,
    required this.isObscure,
  }) ;

  @override
  Widget build(BuildContext context) {

    return TextFieldContainer(

      child: TextField(
        keyboardType: textInputType == ""? TextInputType.text: textInputType,
        maxLength: maxlength == null? null: maxlength,
        onChanged: onChanged,
        obscureText: isObscure,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          labelText: hintText,
          fillColor: Colors.grey,
          labelStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 14, fontFamily: 'OpenSans' ),
          //counterStyle: TextStyle(height: double.minPositive, fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16, fontFamily: 'OpenSans' ),
          counterText:"" ,
          icon: Icon(
              icon,
              color: Colors.grey),


          //hintText: hintText ,
          //hintStyle: TextStyle(height: double.minPositive, color: Colors.black, fontSize: 14),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
