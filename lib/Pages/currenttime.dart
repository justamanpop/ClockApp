import 'package:customclockapp/Utils/TimeZoneMap.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

class CurrentTime extends StatefulWidget {
  @override
  _CurrentTimeState createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  final DateFormat formatter24Hour = DateFormat('Hms');
  final DateFormat formatter12Hour = DateFormat('jms');

  final DateFormat formatterDateOnly = DateFormat('yMMMMEEEEd');

  DateFormat currFormatter = DateFormat('Hms');

  String currTime = "--:--:--";
  String currLocationCountryName;
  tz.Location currLocation;
  Timer _clockTimer;
  bool is24Hour = true;

  @override
  void initState() {
    tz.initializeTimeZones();
    currLocationCountryName = TimeZoneMap.map.keys.toList()[0];
    currLocation = tz.getLocation(TimeZoneMap.map[currLocationCountryName]);
    _clockTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        currTime = currFormatter.format(tz.TZDateTime.now(currLocation));
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _clockTimer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'World Time',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 36,
              ))
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Center(
            child: Column(
          children: [
            Divider(
              color: Colors.grey,
              thickness: 0.3,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '$currTime',
              style: TextStyle(
                  fontSize: 52,
                  color: Color(0xffffffff),
                  letterSpacing: 2,
                  fontFamily: 'DigitalDelivery',
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Indian Standard Time',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  '${formatterDateOnly.format(tz.TZDateTime.now(currLocation))}',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  is24Hour ? '24 Hour Display' : '12 Hour Display',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Switch(
                  value: is24Hour,
                  onChanged: (bool state) {
                    setState(() {
                      is24Hour = state;
                      currFormatter =
                          is24Hour ? formatter24Hour : formatter12Hour;
                    });
                  },
                  inactiveTrackColor: Colors.blue,
                  activeColor: Colors.blueAccent,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
