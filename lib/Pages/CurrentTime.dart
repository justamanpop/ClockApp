import 'package:customclockapp/Utils/TimeZoneUtils.dart';
import 'package:customclockapp/Pages/AddLocation.dart';
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
  bool is24Hour = true;
  List<String> listItems = <String>['Spain', 'England', 'Germany', 'China'];

  @override
  void initState() {
    tz.initializeTimeZones();
    currLocationCountryName = TimeZoneUtils.mapForTzMethod.keys.toList()[0];
    currLocation = tz.getLocation(TimeZoneUtils.mapForTzMethod[currLocationCountryName]);
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
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:AssetImage('flags/${listItems[index]}.png') ,
                        radius: 25,
                      ),
                      title: Text(
                        '${listItems[index]}    ${currFormatterNoSeconds.format(tz.TZDateTime.now(tz.getLocation(TimeZoneUtils.mapForTzMethod[listItems[index]])))}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        TimeZoneUtils.isSummerEurope()?TimeZoneUtils.mapForTimeZoneNameSummer[listItems[index]]:TimeZoneUtils.mapForTimeZoneNameWinter[listItems[index]],
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 25, height: 25),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                primary: Colors.red),
                            child: Icon(
                              Icons.remove,
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
            )
          ],
        ),
      ),
    );
  }

  Future<void> deleteData(int index) async {
    AlertDialog alert = AlertDialog(
      title: Text("Stop tracking",style: TextStyle(color: Colors.black),),
      content: Text("Are you sure you want to stop tracking the time in ${listItems[index]}?",style: TextStyle(color: Colors.black),),
      backgroundColor: Color(0xff004ecb),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel',style: TextStyle(color: Colors.black)), ),
        TextButton(
            onPressed: () async {
              listItems.removeAt(index);
              Navigator.of(context).pop();
            },
            child: Text('Continue',style: TextStyle(color: Colors.black),)),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

}
