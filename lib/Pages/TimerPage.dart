import 'package:customclockapp/Pages/WorldClock/CurrentTime.dart';
import 'package:customclockapp/Pages/screen2.dart';
import 'package:customclockapp/Widgets/RadialDurationPicker.dart';
import 'package:customclockapp/Widgets/TimerDisplay.dart';
import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage>
    with SingleTickerProviderStateMixin {
  //region related to bottom navigation bar
  static List<Widget> _widgetOptions = <Widget>[
    CurrentTime(),
    ScreenTwo(),
    TimerPage()
  ];

  void _onItemTapped(int index) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => _widgetOptions[index]),
        (Route<dynamic> route) => false);
  }

  //endregion

  //region properties for timer display
  bool _timerSet = false;
  TimerStatus _timerStatus;
  Duration _timerDuration = Duration(seconds: 10);
  TimerProgressIndicatorDirection _progressIndicatorDirection =
      TimerProgressIndicatorDirection.clockwise;
  TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;

  //endregion

  //region properties for radial time picker
  int _currentHour = 0;
  int _currentMinute = 0;
  int _currentSecond = 0;

  //endregion

  @override
  void initState() {
    _timerStatus = TimerStatus.reset;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
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
                onPressed: () {},
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
              thickness: 0.5,
            ),
            SizedBox(
              height: 10,
            ),
            _timerSet
                ? Container(
                    height: 360,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: SimpleTimer(
                              duration: _timerDuration,
                              status: _timerStatus,
                              timerStyle: TimerStyle.ring,
                              backgroundColor: Colors.grey,
                              progressIndicatorColor: Colors.blue,
                              progressIndicatorDirection:
                                  _progressIndicatorDirection,
                              progressTextCountDirection:
                                  _progressTextCountDirection,
                              progressTextStyle: TextStyle(color: Colors.white),
                              strokeWidth: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 140,
                            child: NumberPicker(
                              value: _currentHour,
                              haptics: true,
                              selectedTextStyle:
                                  TextStyle(color: Colors.blue, fontSize: 36),
                              textStyle:
                                  TextStyle(color: Colors.grey, fontSize: 36),
                              minValue: 0,
                              maxValue: 23,
                              onChanged: (value) =>
                                  setState(() => _currentHour = value),
                              infiniteLoop: true,
                            ),
                          ),
                          Container(
                            height: 140,
                            child: NumberPicker(
                              value: _currentMinute,
                              haptics: true,
                              selectedTextStyle:
                                  TextStyle(color: Colors.blue, fontSize: 36),
                              textStyle:
                                  TextStyle(color: Colors.grey, fontSize: 36),
                              minValue: 0,
                              maxValue: 59,
                              onChanged: (value) =>
                                  setState(() => _currentMinute = value),
                              infiniteLoop: true,
                            ),
                          ),
                          Container(
                            height: 140,
                            child: NumberPicker(
                              value: _currentSecond,
                              haptics: true,
                              selectedTextStyle:
                                  TextStyle(color: Colors.blue, fontSize: 36),
                              textStyle:
                                  TextStyle(color: Colors.grey, fontSize: 36),
                              minValue: 0,
                              maxValue: 59,
                              onChanged: (value) =>
                                  setState(() => _currentSecond = value),
                              infiniteLoop: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Current value: $_currentHour : $_currentMinute : $_currentSecond',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _timerDuration = Duration(
                            seconds: _currentSecond,
                            minutes: _currentMinute,
                            hours: _currentHour);
                        _timerSet = true;
                        _timerStatus = TimerStatus.start;
                      });
                    },
                    child: Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      //fixedSize: Size(60,60),
                      primary: Color(0xff5c6bc0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_timerSet) {
                        setState(() {
                          _timerSet = false;
                        });
                      } else {
                        setState(() {
                          _currentHour = 0;
                          _currentMinute = 0;
                          _currentSecond = 0;
                        });
                      }
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      //fixedSize: Size(60,60),
                      primary: Color(0xff5c6bc0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            )
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
          onTap: _onItemTapped,
        ));
  }
}
