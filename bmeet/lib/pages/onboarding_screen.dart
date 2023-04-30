import 'package:bmeet/intro_screens/intro_page_2.dart';
import 'package:bmeet/intro_screens/intro_page_3.dart';
import 'package:bmeet/pages/authPhone_page.dart';
import 'package:bmeet/pages/authVerify_page.dart';
import 'package:bmeet/pages/auth_page.dart';
import 'package:bmeet/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../intro_screens/intro_page_1.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //controller to keep track of which page we're on
  PageController _controller = PageController();

  //keep track of if we are or the last page or not
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text("skip"),
                ),

                //dot indicators
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),

                //next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MaterialApp(
                              initialRoute: 'phone',
                              debugShowCheckedModeBanner: false,
                              routes: {
                                'auth':(context) => Auth(),
                                // 'phone': (context) => AuthPhone(),
                                // 'verify': (context) => AuthVerify(),
                                'home':(context) => HomePage(),
                              },
                            );
                          }));
                        },
                        child: Text("done"),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(
                              milliseconds: 400,
                            ),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text("next"),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
