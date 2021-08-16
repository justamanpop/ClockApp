import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AddTimerPage extends StatefulWidget {
  const AddTimerPage({Key key}) : super(key: key);

  @override
  _AddTimerPageState createState() => _AddTimerPageState();
}

class _AddTimerPageState extends State<AddTimerPage> {

  //region properties for radial time picker
  int _currentHour = 0;
  int _currentMinute = 0;
  int _currentSecond = 0;

  TextEditingController _labelTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Add Timer',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: <Widget>[
            Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(width: 25,),
                Container(
                  width: 285,
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,

                    controller: _labelTextController,

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
                        onPressed: _labelTextController.clear,
                        icon: Icon(Icons.clear, color: Colors.white,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
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
                      //TODO logic to add timer, a check for if timer is set to zero
                    },
                    child: Text(
                      'Add',
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
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
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
        );
  }

  //display an alert telling user he picked time as 0 when starting a timer
  void showZeroTimePickedAlert()
  {
    final snackBar = SnackBar(content: Text('Please pick a non zero time', style: TextStyle(fontSize: 18, color: Colors.grey),), backgroundColor: Color(0xff212121), duration: Duration(seconds: 3),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
