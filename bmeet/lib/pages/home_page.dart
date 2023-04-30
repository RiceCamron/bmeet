import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:latlong2/latlong.dart';
import 'package:bmeet/Cards/meet_card.dart' as meetCard;
import 'package:bmeet/Cards/partner_card.dart' as partnerCard;
import 'package:bmeet/Cards/notification_card.dart' as notificationCard;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  var _pages = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        meetCard.MeetCard(),
        meetCard.MeetCard(),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        partnerCard.PartnerCard(),
        partnerCard.PartnerCard(),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        notificationCard.NotificationCard(),
        notificationCard.NotificationCard(),
      ],
    ),
  ];

  var _appBarTitles = [
    'Главная',
    'Партнеры',
    'Уведомления',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 27, 47),
        title: Text(_appBarTitles[_currentPage]), // update app bar title
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () async {
            // Log out the current user
            try {
              await FirebaseAuth.instance.signOut();
              // Navigate to the phone auth page
              Navigator.pushNamed(context, 'phone');
            } catch (e) {
              print('Error signing out: $e');
            }
          },
        ),
      ),
      body: Center(
        child: _pages.elementAt(_currentPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 3, 27, 47),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people,),
            label: "Патнеры",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sms,),
            label: "Уведомления",
          ),
        ],
        currentIndex: _currentPage,
        fixedColor: Colors.blue,
        onTap: (int intIndex) {
          setState(() {
            _currentPage = intIndex;
          });
        },
      ),
    );
  }
}
