import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class DurationPicker extends StatefulWidget {
  const DurationPicker({Key key}) : super(key: key);

  @override
  _DurationPickerState createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {

  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Container(
          height: 130,
          width: MediaQuery.of(context).size.width,
          child: NumberPicker(
            value: _currentValue,
            haptics: true,
            selectedTextStyle: TextStyle(color:Colors.blue, fontSize: 36),
            textStyle: TextStyle(color: Colors.grey, fontSize: 36),
            minValue: 0,
            maxValue: 10,
            onChanged: (value) => setState(() => _currentValue = value),
            infiniteLoop: true,
          ),
        ),
        SizedBox(height: 20,),
        Text('Current value: $_currentValue'),
      ],
    );
  }
}
