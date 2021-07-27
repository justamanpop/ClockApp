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
  final DateFormat formatter = DateFormat('Hms');
  String currTime="--:--:--";
  String currLocationCountryName;
  tz.Location currLocation;
  Timer _clockTimer;
  @override
  void initState() {
    tz.initializeTimeZones();
    currLocationCountryName = TimeZoneMap.map.keys.toList()[0];
    currLocation = tz.getLocation(TimeZoneMap.map[currLocationCountryName]);
    _clockTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        currTime = formatter.format(tz.TZDateTime.now(currLocation));
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
      body: Container(
        color: Colors.black,
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: Image(
                image: AssetImage('flags/$currLocationCountryName.png'),
                height: 125,
                width: 190,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.blueAccent,
                width: 1,
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.blue.shade200,
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                items: TimeZoneMap.map.keys
                    .map((String val) => DropdownMenuItem<String>(
                          child: Center(
                            child: Text(
                              val,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          value: val,
                        ))
                    .toList(),
                value: currLocationCountryName,
                onChanged: (String newVal) {
                  setState(() {
                    currLocationCountryName = newVal;
                    currLocation = tz
                        .getLocation(TimeZoneMap.map[currLocationCountryName]);
                  });
                },
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$currTime',
                  style: TextStyle(
                      fontSize: 56,
                      color: Colors.white,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        )),
      ),
    );
  }
}
