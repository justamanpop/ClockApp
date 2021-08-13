import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class TimerDisplay extends StatefulWidget {
  final TimerController _timerController;
  final Duration _timerDuration;

  TimerDisplay(this._timerController, this._timerDuration);

  @override
  _TimerDisplayState createState() => _TimerDisplayState(_timerController, _timerDuration);
}

class _TimerDisplayState extends State<TimerDisplay> {
  TimerProgressIndicatorDirection _progressIndicatorDirection = TimerProgressIndicatorDirection.clockwise;
  TimerProgressTextCountDirection _progressTextCountDirection = TimerProgressTextCountDirection.count_down;
  TimerController _timerController;
  Duration _timerDuration;

  _TimerDisplayState(this._timerController, this._timerDuration);

  @override
  void initState() {
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
                duration: _timerDuration,
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
