import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_shade6/components/DogWalkerCard.dart';
import 'package:flutter_app_shade6/components/HeaderwithButton.dart';
import 'package:flutter_app_shade6/components/RoundedButton.dart';
import 'package:flutter_app_shade6/ui/SliderModel.dart';
import 'package:flutter_app_shade6/global_variables.dart';
import 'package:flutter_app_shade6/ui/signup.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea (
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HeaderwithButton("Home","Explore dog walkers","+ Book a walk"),
                  HorizontalHeader("Near you", "View All"),
                  HorizontalList(),
                  dividerline(),
                  HorizontalHeader("Suggested", "View All"),
                  HorizontalList(),
                ]),
          ),
        ),
      ),
      ),
    );
  }

  Widget dividerline() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: Divider(
      height: 1,
      thickness: 1,
      indent: 20,
      endIndent: 0,
      color: Colors.black,
    ));
  }

  Widget HorizontalHeader(String title, String titledesc) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 30,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text(titledesc,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      backgroundColor: Colors.white,
                    decoration: TextDecoration.underline,)),
            ]),
      ),
    );
  }

  Widget HorizontalList() {
    return Container(
        height: 200,
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          DogWalkerCard(
              description: '7 Km from you',
              title: 'Mason York',
              image: 'assets/images/slider1.jpg',
              rate: '\$3\\h'),
          DogWalkerCard(
              description: '9 Km from you',
              title: 'Mark Greene',
              image: 'assets/images/slider2.jpg',
              rate: '\$7\\h'),
          DogWalkerCard(
              description: '10 Km from you',
              title: 'Alex Murray',
              image: 'assets/images/slider3.jpg',
              rate: '\$10\\h'),
        ]));
  }
}
