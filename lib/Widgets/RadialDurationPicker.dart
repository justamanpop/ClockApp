import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class RadialDurationPicker extends StatefulWidget {
  const RadialDurationPicker({Key key}) : super(key: key);

  @override
  _RadialDurationPickerState createState() => _RadialDurationPickerState();
}

class _RadialDurationPickerState extends State<RadialDurationPicker> {
  int _currentHour = 0;
  int _currentMinute = 0;
  int _currentSecond = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                selectedTextStyle: TextStyle(color: Colors.blue, fontSize: 36),
                textStyle: TextStyle(color: Colors.grey, fontSize: 36),
                minValue: 0,
                maxValue: 23,
                onChanged: (value) => setState(() => _currentHour = value),
                infiniteLoop: true,
              ),
            ),
            Container(
              height: 140,
              child: NumberPicker(
                value: _currentMinute,
                haptics: true,
                selectedTextStyle: TextStyle(color: Colors.blue, fontSize: 36),
                textStyle: TextStyle(color: Colors.grey, fontSize: 36),
                minValue: 0,
                maxValue: 59,
                onChanged: (value) => setState(() => _currentMinute = value),
                infiniteLoop: true,
              ),
            ),
            Container(
              height: 140,
              child: NumberPicker(
                value: _currentSecond,
                haptics: true,
                selectedTextStyle: TextStyle(color: Colors.blue, fontSize: 36),
                textStyle: TextStyle(color: Colors.grey, fontSize: 36),
                minValue: 0,
                maxValue: 59,
                onChanged: (value) => setState(() => _currentSecond = value),
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
        SizedBox(height: 20,),
      ],
    );
  }
}
