import 'dart:ffi';

import 'package:bmeet/Module/http.dart';
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

class Meet {
  int id;
  String from_id;
  String meet_name;
  String description;
  String meet_date;
  String meet_time;
  int member_id;
  int task_id;
  String create_at;
  int notification_id;
  double latitude_location;
  double long_location;

  Meet(
      this.id,
      this.from_id,
      this.meet_name,
      this.description,
      this.meet_date,
      this.meet_time,
      this.member_id,
      this.task_id,
      this.create_at,
      this.notification_id,
      this.latitude_location,
      this.long_location);
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  var _pages = [];

  List<Meet> meets = [];

  @override
  void initState() {
    super.initState();
    refreshMeets();
    _pages = [
      RefreshIndicator(
        onRefresh: refreshMeets,
        child: ListView.separated(
          itemCount: meets.length,
          itemBuilder: (context, i) => ListTile(
            leading: Icon(Icons.person),
            title: Text(meets[i].meet_name),
          ),
          separatorBuilder: (context, i) => Divider(),
        ),
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
  }

  Future<void> refreshMeets() async {
    var result = await http_post('/meets');

    print(result);
    if (result.ok) {
      setState(() {
        meets.clear();
        var in_users = result.data as List<dynamic>;
        in_users.forEach((in_user) {
          meets.add(Meet(
            in_user['id'],
            in_user['from_id'],
            in_user['meet_name'],
            in_user['description'],
            in_user['meet_date'],
            in_user['meet_time'],
            in_user['member_id'],
            in_user['task_id'],
            in_user['create_at'],
            in_user['notification_id'],
            in_user['latitude_location'],
            in_user['long_location'],
          ));
        });
      });
    }
  }

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
            icon: Icon(
              Icons.home,
            ),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: "Патнеры",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sms,
            ),
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
