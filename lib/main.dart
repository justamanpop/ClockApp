import 'package:flutter/material.dart';
import 'package:customclockapp/Pages/CurrentTime.dart';
import 'package:customclockapp/Pages/screen2.dart';
import 'package:customclockapp/Pages/screen3.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clock",
      home: TabWindow(),
    );
  }
}

class TabWindow extends StatefulWidget {
  const TabWindow({Key key}) : super(key: key);

  @override
  _TabWindowState createState() => _TabWindowState();
}

class _TabWindowState extends State<TabWindow> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[CurrentTime(),ScreenTwo(),ScreenThree()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}



