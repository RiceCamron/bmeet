import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class PartnerCard extends StatelessWidget {
  final LatLng center = LatLng(51.131570993888346, 71.4290123485046);
  final String apiKey = 'AIzaSyCZ_NWndLSxDMyqscWLEKbEwFwT2VJBwHI';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 248, 253, 255),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 186, 173, 255).withOpacity(0.35),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    width: 400,
                    color: Color.fromARGB(0, 238, 252, 255),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(10.0),
                  //   child: Image.network(
                  //     'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMDUzMDJ8MHwxfHNlYXJjaHwyMHx8UGVvcGxlfGVufDF8fHx8MTY4MDY5ODA5MQ&ixlib=rb-4.0.3&q=80&w=200',
                  //     height: 40,
                  //     width: 60,
                  //   ),
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Цукерберг',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),

                  Text(
                    'Гениральный директор',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                        ],
                      ),
                      Text(
                        'Организация "Meta Platforms, Inc."',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
