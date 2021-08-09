import 'package:customclockapp/Pages/WorldClock/CurrentTime.dart';
import 'package:customclockapp/Pages/screen2.dart';
import 'package:customclockapp/Widgets/RadialTimePicker.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key key}) : super(key: key);
  static List<Widget> _widgetOptions = <Widget>[
    CurrentTime(),
    ScreenTwo(),
    TimerPage()
  ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => _widgetOptions[index]),
              (Route<dynamic> route) => false);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Timer',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                },
                tooltip: 'Add a new timer',
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 36,
                ))
          ],
        ),
        body: Column(
          children: <Widget>[
            Divider(
              color: Colors.grey,
              thickness: 0.3,
            ),
            SizedBox(height: 10,),
            DurationPicker(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.access_time),
    label: 'Clock',
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
    currentIndex: 2,
    selectedItemColor: Colors.blueAccent,
    onTap: _onItemTapped
    ,
    )
    );
  }
}

