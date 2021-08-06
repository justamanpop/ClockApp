import 'package:customclockapp/Pages/WorldClock/CurrentTime.dart';
import 'package:customclockapp/Pages/screen2.dart';
import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key key}) : super(key: key);
  static List<Widget> _widgetOptions = <Widget>[
    CurrentTime(),
    ScreenTwo(),
    ScreenThree()
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
      body: Center(
        child: Container(
          child:Text('I am Screen 3'),
          color: Colors.green,
        ),
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
          onTap: _onItemTapped,
        )
    );
  }
}

