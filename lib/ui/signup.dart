import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_shade6/NavigationBar.dart';
import 'package:flutter_app_shade6/components/RoundedButton.dart';
import 'package:flutter_app_shade6/components/RoundedInputField.dart';
import 'package:flutter_app_shade6/components/RoundedPasswordField.dart';
import 'package:flutter_app_shade6/ui/HomePage.dart';

import '../global_variables.dart';

import 'package:http/http.dart' as http;

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

String? personName="usrname-1", personEmail = "joe@example.com", personPIN = "usrid-1";

class _signupState extends State<signup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Lets Start Here",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'OpenSans',
                      color: Colors.black),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  "Fill in your details to begin",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                      color: Colors.grey),
                ),
                SizedBox(height: size.height * 0.02),
                /*Image.asset(
                        "assets/images/registerstudy.png",
                        height: size.height * 0.25,
                        width: size.width * 0.75,
                      ),*/
                RoundedInputField(
                  hintText: "Full Name",
                  textInputType: TextInputType.text,
                  icon: Icons.person_add_alt_1,
                  onChanged: (value) {
                    personName = value;
                  },
                  minlength: 5,
                  maxlength: 30,
                  isObscure: false,
                ),
                RoundedInputField(
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                  minlength: 5,
                  maxlength: 30,
                  icon: Icons.email,
                  onChanged: (value) {
                    personEmail = value;
                  },
                  isObscure: false,
                ),
                new RoundedInputField(
                  hintText: "Password",
                  textInputType: TextInputType.visiblePassword,
                  minlength: 5,
                  maxlength: 30,
                  icon: Icons.keyboard,
                  onChanged: (value) {
                    personPIN = value;
                  },
                  isObscure: true,
                ),
                /*RoundedPasswordField(
                      textInputType: TextInputType.text,
                      //minlength: 4,
                      labelText:"Enter Password",
                      maxlength: 30,
                      onChanged: (value) {
                        personPIN = value + "0000";
                      },
                    ),*/
                RoundedButton(
                  text: "sign up",
                  onPressed: () {
                    _signupUser();

                    Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => NavigationBar(),
                      ),
                          (route) => false,//if you want to disable back feature set to false
                    );
                  },
                  textColor: Colors.white,
                  color: Colors.orange,
                  buttonHeight: 50,
                  buttonWidth: size.width * 0.8,
                ),
                Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: RichText(
                      text: TextSpan(
                        text: "By signing in, I agree with ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Terms of Use ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: ' Privacy Policy ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signupUser() async {
    var signupuserurl = "https://api.m3o.com/v1/user/Create";

    var data = {
      'email': personEmail,
      'id': "usrid-1",
      'password': personPIN,
      'username': personName
    };
    String body = json.encode(data);

    try {
      http.Response response = await http.post(
        Uri.parse(signupuserurl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      //print("responsebody" + response.body.toString());

      if (response.statusCode == 200) {
        var responseparsed = jsonDecode(response.body);

        if (responseparsed['status'] == "success") {
        } else {}
      } else {
        //throw Exception("Error ");
      }
    } on Error catch (e) {
      //print(e.stackTrace);
    }
  }
}
