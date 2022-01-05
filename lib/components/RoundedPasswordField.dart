import 'package:flutter/material.dart';
import 'package:flutter_app_shade6/global_variables.dart';
import 'package:flutter_app_shade6/components/text_field_container.dart';


bool _isObscure = true;

var passwordnotifier = ValueNotifier<int>(0);

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final int maxlength;
  final int minlength;
  final bool isObscure;

  const RoundedPasswordField({
    required this.hintText,
    required this.icon ,
    required this.onChanged,
    required this.textInputType,
    required this.maxlength,
    required this.minlength,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    return
      ValueListenableBuilder(
          valueListenable: passwordnotifier,
          builder: (context, value, widget) {
            return Stack(alignment: Alignment.centerRight, children: <Widget>[
            TextFieldContainer(
              child: TextField(
                obscureText: _isObscure,
                keyboardType:
                    textInputType == "" ? TextInputType.text : textInputType,
                maxLength: maxlength == null ? null : maxlength,
                onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  labelStyle: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor, fontSize: 14, fontFamily: 'OpenSans' ),
                  counterStyle: TextStyle(
                      height: double.minPositive,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14),
                  counterText: "",
                  //hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),

                  /*IconButton(
            icon: Icon(
              _isObscure? Icons.visibility:Icons.visibility_off,
              color: Colors.black,
            ),
            iconSize: 30,
            onPressed: (){

              if(_isObscure)
                _isObscure = false;
              else
                _isObscure = true;

            },

          ),*/
                  border: InputBorder.none,
                ),
              ),
            ),

      IconButton(
        icon: Icon(_isObscure? Icons.visibility:Icons.visibility_off, color: const Color(0xfff96800)),
        iconSize: 30,
        onPressed: () {
          //print(_isObscure);
          passwordnotifier.value++;
          FocusScope.of(context).requestFocus(FocusNode());
          if (_isObscure)
            _isObscure = false;
          else
            _isObscure = true;


        },
      ),
    ]);

          });
  }
}
