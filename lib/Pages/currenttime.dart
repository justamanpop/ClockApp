import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class CurrentTime extends StatefulWidget {
  @override
  _CurrentTimeState createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  final DateFormat formatter = DateFormat('Hms');
  String currTime;

  void updateTime() {
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        currTime = formatter.format(DateTime.now());
      });
    });
  }

  Widget build(BuildContext context) {
    updateTime();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.black,
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){},
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
                Image(
                  image: AssetImage('flags/india.png'),
                  height: 150,
                  width: 195,
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'India',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 200,
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
          ],
        )),
      ),
    );
  }
}
