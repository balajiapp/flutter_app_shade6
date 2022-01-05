import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_shade6/components/RoundedButton.dart';
import 'package:flutter_app_shade6/ui/SliderModel.dart';
import 'package:flutter_app_shade6/global_variables.dart';
import 'package:flutter_app_shade6/ui/signup.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}


class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  void initState() {
    super.initState();
  }


  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderModel(
        title: "Too Tired to Walk your Dog?",
        description: "Lets help you!",
        image: "assets/images/slider1.jpg"),
    SliderModel(
        title: "Convenient Flexible Effective",
        description: "Description goes here..",
        image: "assets/images/slider2.jpg"),
    SliderModel(
        title: "Feel Your Freedom",
        description: "Description goes here..",
        image: "assets/images/slider3.jpg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                        CircleAvatar(
                          backgroundColor: _currentPage == index? Colors.white:Colors.blueGrey,
                          radius: 20,
                          child: Text((index+1).toString(), style: TextStyle(
                              color: _currentPage == index? Colors.blueGrey:Colors.white,
                              fontWeight: FontWeight.bold,
                          )),//CircleAvatar
                      ),
                          if(index != (_pages.length - 1))
                             Text("-", style: TextStyle(
                              color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          )),
                    ]
                    );
                  }
                  ),
              ),
              ),

              RoundedButton(text: "Join Our Community",
                  onPressed: () {},
                  color: Colors.orange,
                  textColor: Colors.white,
                  buttonWidth: size.width * 0.9,
                  buttonHeight: 50 ),
              InkWell(
                onTap: ()  async {

                },
                child:
                  RichText(
                    text: TextSpan(
                      text: "Already a member? ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,
                        color: Colors.white
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'sign in', style: TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.orange,
                          fontSize: 16,
                        ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushAndRemoveUntil<dynamic>(
                                context,
                                MaterialPageRoute<dynamic>(
                                  builder: (BuildContext context) => signup(),
                                ),
                                    (route) => false,//if you want to disable back feature set to false
                              );
                          print('tapped');
                        }
                        ),

                      ],
                    ),
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

