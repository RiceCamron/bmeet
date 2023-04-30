import 'package:bmeet/pages/auth_page.dart';
import 'package:bmeet/pages/home_page.dart';
import 'package:bmeet/pages/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Color.fromARGB(255, 3, 27, 47),
            accentColor: Color.fromRGBO(19, 30, 52, 1),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          home: InitializerWidget(),
    );
  }
}

class InitializerWidget extends StatefulWidget {
  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  fa.FirebaseAuth? _auth;
  fa.User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = fa.FirebaseAuth.instance;
    _user = _auth?.currentUser;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _user == null
            ? Auth()
            : HomePage(),
    );
  }
}
