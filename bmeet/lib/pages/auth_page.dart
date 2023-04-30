import 'package:bmeet/pages/authPhone_page.dart';
import 'package:bmeet/pages/authVerify_page.dart';
import 'package:bmeet/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _fioController = TextEditingController();
  final _nameCompanyController = TextEditingController();
  final _titleJobController = TextEditingController();
  final _mailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Text(
              "Регистрация",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 163, 211, 251).withOpacity(0.35),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: TextField(
                  controller: _fioController,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'Введите ФИО',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 163, 211, 251).withOpacity(0.35),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: TextField(
                  controller: _nameCompanyController,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'Наименование компании',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 163, 211, 251).withOpacity(0.35),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: TextField(
                  controller: _titleJobController,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'Должность',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 163, 211, 251).withOpacity(0.35),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: TextField(
                  controller: _mailController,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'Электронная почта',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 3, 27, 47),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MaterialApp(
                    initialRoute: 'phone',
                    debugShowCheckedModeBanner: false,
                    routes: {
                      'auth': (context) => Auth(),
                      'phone': (context) => AuthPhone(
                            fioController: _fioController,
                            nameCompanyController: _nameCompanyController,
                            titleJobController: _titleJobController,
                            mailController: _mailController,
                          ),
                      'verify': (context) => AuthVerify(
                            fioController: _fioController,
                            nameCompanyController: _nameCompanyController,
                            titleJobController: _titleJobController,
                            mailController: _mailController,
                          ),
                      'home': (context) => HomePage(),
                    },
                  );
                }));
                Navigator.pushNamed(context, 'phone');
                print('Working');
              },
              child: Text("Далее"),
            ),
            // Navigator.pushNamed(context, 'verify');
          ),
        ],
      ),
    );
  }
}
