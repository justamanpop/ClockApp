import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class DurationPicker extends StatefulWidget {
  const DurationPicker({Key key}) : super(key: key);

  @override
  _DurationPickerState createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
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
        Row(
          children: <Widget>[
            SizedBox(
              width: 70,
            ),
            RawMaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 48,
              ),
              shape: CircleBorder(side: BorderSide(color: Colors.grey,width: 0.5)),
            ),
            SizedBox(
              width: 20,
            ),
            RawMaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.stop,
                color: Colors.white,
                size: 48,
              ),
              shape: CircleBorder(side: BorderSide(color: Colors.grey,width: 0.5)),
            ),
          ],
        )
      ],
    );
  }
}
