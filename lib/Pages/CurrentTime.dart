import 'package:customclockapp/Pages/SetPrimaryLocation.dart';
import 'package:customclockapp/Pages/screen2.dart';
import 'package:customclockapp/Pages/screen3.dart';
import 'package:customclockapp/Utils/TimeZoneMaps.dart';
import 'package:customclockapp/Pages/AddLocation.dart';
import 'package:customclockapp/Utils/TimeZoneUtilFunctions.dart';
import 'package:customclockapp/Utils/UserPreferences.dart';
import 'package:customclockapp/main.dart';
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

  final DateFormat formatter24HourNoSeconds = DateFormat('Hm');
  final DateFormat formatter12HourNoSeconds = DateFormat('jm');

  final DateFormat formatterDateOnly = DateFormat('yMMMMEEEEd');

  DateFormat currFormatter = DateFormat('Hms');
  DateFormat currFormatterNoSeconds = DateFormat('Hm');

  String currTime = "--:--:--";
  String currLocationCountryName;
  tz.Location currLocation;
  Timer _clockTimer;
  bool is24Hour = prefs.getBool('is24Hour');

  static List<Widget> _widgetOptions = <Widget>[
    CurrentTime(),
    ScreenTwo(),
    ScreenThree()
  ];

  @override
  void initState() {
    tz.initializeTimeZones();

    currFormatter = is24Hour ? formatter24Hour : formatter12Hour;
    currFormatterNoSeconds =
        is24Hour ? formatter24HourNoSeconds : formatter12HourNoSeconds;

    currLocationCountryName = UserPreferences.currLocation;
    currLocation =
        tz.getLocation(TimeZoneMaps.mapForTzMethod[currLocationCountryName]);
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

  void _onItemTapped(int index) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => _widgetOptions[index]),
        (Route<dynamic> route) => false);
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddLocation()),
                  );
                },
                tooltip: 'Add a location to track',
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 36,
                ))
          ],
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Divider(
                color: Colors.grey,
                thickness: 0.3,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Image.asset(
                    'flags/${UserPreferences.currLocation}.png',
                    height: 44,
                    width: 44,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${UserPreferences.currLocation}',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetPrimaryLocation()),
                      );
                    },
                    tooltip: 'Change Primary Location',
                  ),
                ],
              ),
              SizedBox(
                height: 25,
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
                    width: 25,
                  ),
                  Text(
                    '${TimeZoneUtilFunctions.getTimeZoneNameOfLocation(UserPreferences.currLocation)}',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ],
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
                thickness: 0.3,
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
                        prefs.setBool('is24Hour', is24Hour);
                        currFormatter =
                            is24Hour ? formatter24Hour : formatter12Hour;
                        currFormatterNoSeconds = is24Hour
                            ? formatter24HourNoSeconds
                            : formatter12HourNoSeconds;
                      });
                    },
                    inactiveTrackColor: Colors.blue,
                    activeColor: Colors.blueAccent,
                  ),
                ],
              ),
              SizedBox(
                height: 0.5,
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.3,
              ),
              Material(
                color: Colors.black,
                child: UserPreferences.savedLocations.length == 0
                    ? Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Track time in other locations by clicking on the the + in the top right of the screen',
                            style: TextStyle(
                                color: Color(0xff0080cb),
                                fontSize: 20,
                                wordSpacing: 1,
                                height: 1.3),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            height: 245,
                            child: Scrollbar(
                              isAlwaysShown: true,
                              thickness: 2.5,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount:
                                      UserPreferences.savedLocations.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'flags/${UserPreferences.savedLocations.elementAt(index)}.png'),
                                        radius: 25,
                                      ),
                                      title: Text(
                                        '${UserPreferences.savedLocations.elementAt(index)}    ${currFormatterNoSeconds.format(tz.TZDateTime.now(tz.getLocation(TimeZoneMaps.mapForTzMethod[UserPreferences.savedLocations.elementAt(index)])))}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        TimeZoneUtilFunctions.getTimeZoneNameOfLocation(UserPreferences.savedLocations.elementAt(index)),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              width: 47, height: 25),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.black),
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                deleteData(index);
                                              });
                                            },
                                          )),
                                      focusColor: Colors.yellow,
                                    );
                                  }),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.3,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.language),
              label: 'World Clock',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Alarm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Timer',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ));
  }

  Future<void> deleteData(int index) async {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Stop tracking",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "Are you sure you want to stop tracking the time in ${UserPreferences.savedLocations.elementAt(index)}?",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: Color(0xffc2c2c2),
        ),
      ),
      insetPadding: EdgeInsets.all(40),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel', style: TextStyle(color: Colors.blueAccent)),
        ),
        TextButton(
            onPressed: () async {
              UserPreferences.savedLocations
                  .remove(UserPreferences.savedLocations.elementAt(index));
              //TODO make this update database too
              Navigator.of(context).pop();
            },
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.blueAccent),
            )),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
