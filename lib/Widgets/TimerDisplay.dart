import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class TimerDisplay extends StatefulWidget {
  const TimerDisplay({Key key}) : super(key: key);

  @override
  _TimerDisplayState createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay> with SingleTickerProviderStateMixin {
  TimerProgressIndicatorDirection _progressIndicatorDirection = TimerProgressIndicatorDirection.clockwise;
  TimerProgressTextCountDirection _progressTextCountDirection = TimerProgressTextCountDirection.count_down;
  TimerController _timerController;

  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SimpleTimer(
                duration: Duration(seconds: 20),
                controller: _timerController,
                timerStyle: TimerStyle.ring,
                backgroundColor: Colors.grey,
                progressIndicatorColor: Colors.blue,
                progressIndicatorDirection: _progressIndicatorDirection,
                progressTextCountDirection: _progressTextCountDirection,
                progressTextStyle: TextStyle(color: Colors.white),
                strokeWidth: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
