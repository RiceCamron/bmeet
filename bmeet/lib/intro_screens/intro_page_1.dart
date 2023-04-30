import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatefulWidget {
  @override
  _IntroPage1State createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 60),
              child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_q5qvqtnr.json'),
            ),
            Container(
              child: Text(
                'Бизнес-Встречи',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 51, 90)),
              ),
            ),
            Container(
            ),
          ],
        ),
        ],
      ),
    );
  }
}
