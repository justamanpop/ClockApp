import 'package:customclockapp/Pages/Timer/AddTimer.dart';
import 'package:customclockapp/Pages/WorldClock/CurrentTime.dart';
import 'package:customclockapp/Pages/screen2.dart';
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
  bool _timerRunning = false;
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

  //controller for label of primary timer
  TextEditingController primaryLabelController = TextEditingController();

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTimerPage()),
                  );
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
              thickness: 0.5,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(width: 25,),
                _timerSet? Text('${primaryLabelController.text}', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),):Container(
                  width: 285,
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,

                    controller: primaryLabelController,

                    maxLength: 45,

                    style: TextStyle(color: Colors.white, fontSize: 18),

                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 7),
                      filled: true,
                      fillColor: Color(0xff212121),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      hintText: 'Label for timer (optional)',
                      hintStyle: TextStyle(color: Colors.grey),

                      suffixIcon: IconButton(
                        onPressed: primaryLabelController.clear,
                        icon: Icon(Icons.clear, color: Colors.white,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _timerSet
                ? Column(
                    children: [
                      Container(
                        height: 280,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20,),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: SimpleTimer(
                                  progressTextFormatter: (Duration duration) {
                                    String twoDigits(int n) =>
                                        n.toString().padLeft(2, "0");
                                    String twoDigitMinutes = twoDigits(
                                        duration.inMinutes.remainder(60));
                                    String twoDigitSeconds = twoDigits(
                                        duration.inSeconds.remainder(60));
                                    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
                                  },
                                  onEnd: () {
                                    setState(() {
                                      _timerStatus = TimerStatus.reset;
                                      _timerRunning = false;
                                    });
                                  },
                                  duration: _timerDuration,
                                  status: _timerStatus,
                                  timerStyle: TimerStyle.ring,
                                  backgroundColor: Color(0xff383838),
                                  progressIndicatorColor: Color(0xff5c6bc0),
                                  progressIndicatorDirection:
                                      _progressIndicatorDirection,
                                  progressTextCountDirection:
                                      _progressTextCountDirection,
                                  progressTextStyle: TextStyle(
                                      color: Colors.white, fontSize: 80),
                                  strokeWidth: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
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
                        //if no timer has been set yet
                        if (!_timerSet) {

                          //if no starting timer but sec, min, hour are 0
                          if(_currentSecond ==0 && _currentMinute ==0 && _currentHour == 0)
                          {
                            showZeroTimePickedAlert();
                            return;
                          }


                          _timerDuration = Duration(
                              seconds: _currentSecond,
                              minutes: _currentMinute,
                              hours: _currentHour);
                          _timerSet = true;
                          _timerStatus = TimerStatus.start;
                          _timerRunning = true;
                        } else {
                          //if currently unpaused, pause
                          if (_timerStatus == TimerStatus.start)
                            setState(() {
                              _timerStatus = TimerStatus.pause;
                              _timerRunning = false;
                            });
                          else if (_timerStatus == TimerStatus.reset)
                            setState(() {
                              _timerStatus = TimerStatus.start;
                              _timerRunning = true;
                            });

                          //if paused, then unpause
                          else {
                            setState(() {
                              _timerStatus = TimerStatus.start;
                              _timerRunning = true;
                            });
                          }
                        }
                      });
                    },
                    child: Text(
                      '${getButtonValue()}',
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
                      //if a timer is set reset the timer
                      if (_timerSet) {
                        setState(() {
                          _timerSet = false;
                        });
                      } else {
                        //if no timer is set, just reset the duration picker
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

  //gets what string to display in button based on timer set
  String getButtonValue() {
    //if timer has to be initialized and started
    if (!_timerSet) {
      return 'Start';
    }

    //if timer has finished running
    if (_timerStatus == TimerStatus.reset) {
      return 'Restart';
    }

    //if timer is paused
    if (!_timerRunning) return 'Continue';

    //if timer is running
    return 'Pause';
  }

  //display an alert telling user he picked time as 0 when starting a timer
  void showZeroTimePickedAlert()
  {
    final snackBar = SnackBar(content: Text('Please pick a non zero time', style: TextStyle(fontSize: 18, color: Colors.grey),), backgroundColor: Color(0xff212121), duration: Duration(seconds: 3),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
