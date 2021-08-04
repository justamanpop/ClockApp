import 'package:customclockapp/Pages/CurrentTime.dart';
import 'package:customclockapp/Pages/screen3.dart';
import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key key}) : super(key: key);

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
        body: Container(
          child: Center(child: Text('I am Screen 2')),
          color: Colors.red,
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
          currentIndex: 1,
          selectedItemColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ));
  }
}
