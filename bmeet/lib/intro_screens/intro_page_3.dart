import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60),
            child: Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_sj0skmmg.json'),
          ),
          Container(
            child: Text(
              'Смотреть на встречи - удобно!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 51, 90)),
            ),
          ),
          Container(
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
