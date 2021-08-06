import 'package:customclockapp/Pages/WorldClock/CurrentTime.dart';
import 'package:customclockapp/Utils/TimeZoneMaps.dart';
import 'package:customclockapp/Utils/TimeZoneUtilFunctions.dart';
import 'package:customclockapp/Utils/UserPreferences.dart';
import 'package:customclockapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/standalone.dart' as tz;
import 'package:another_flushbar/flushbar.dart';

class SetPrimaryLocation extends StatefulWidget {
  final bool is24Hour;

  const SetPrimaryLocation(this.is24Hour);

  @override
  _SetPrimaryLocationState createState() => _SetPrimaryLocationState();
}

class _SetPrimaryLocationState extends State<SetPrimaryLocation> {
  TextEditingController searchBarController = TextEditingController();

  List<String> allCountryNames =
      TimeZoneMaps.mapForTzMethod.keys.toList();
  List<String> filteredCountryNames;

  final DateFormat formatter24HourNoSeconds = DateFormat('Hm');
  final DateFormat formatter12HourNoSeconds = DateFormat('jm');

  DateFormat currFormatterNoSeconds;

  @override
  void initState() {

    currFormatterNoSeconds =
    widget.is24Hour ? formatter24HourNoSeconds : formatter12HourNoSeconds;

    allCountryNames.remove(UserPreferences.currLocation);
    filteredCountryNames = allCountryNames;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 25,
        ),
        Container(
          height: 60,
          child: Card(
            color: Color(0xff1b1b1b),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: ListTile(
              leading: Icon(Icons.search, color: Color(0xffc2c2c2)),
              title: TextField(
                cursorColor: Colors.white,
                controller: searchBarController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyle(color: Color(0xffc2c2c2), fontSize: 14),
                  hintText: 'Search for a country...',
                ),
                style: TextStyle(
                  color: Color(0xffc2c2c2),
                ),
                onChanged: (String val) {
                  setState(() {
                    filteredCountryNames = allCountryNames
                        .where((countryName) => countryName
                            .toLowerCase()
                            .contains(val.toLowerCase()))
                        .toList();
                  });
                },
              ),
              trailing: IconButton(
                icon: new Icon(
                  Icons.cancel,
                  color: Color(0xffc2c2c2),
                ),
                onPressed: () {
                  searchBarController.clear();
                  setState(() {
                    filteredCountryNames = allCountryNames;
                  });
                },
              ),
            ),
          ),
        ),
        Material(
          color: Colors.black,
          child: Container(
            height: 590,
            child: Scrollbar(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: filteredCountryNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          UserPreferences.savedLocations.add(UserPreferences.currLocation);
                          UserPreferences.currLocation = filteredCountryNames[index];
                          UserPreferences.savedLocations.remove(filteredCountryNames[index]);

                          prefs.setString('currLocation', filteredCountryNames[index]);
                          prefs.setStringList('savedLocations', UserPreferences.savedLocations.toList());

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CurrentTime()),
                              (Route<dynamic> route) => false);
                          confirmAddition(index);
                        },
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              'flags/${filteredCountryNames[index]}.png'),
                          radius: 25,
                        ),
                        title: Text(
                          '${filteredCountryNames[index]}  ${currFormatterNoSeconds.format(tz.TZDateTime.now(tz.getLocation(TimeZoneMaps.mapForTzMethod[filteredCountryNames[index]])))}',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          TimeZoneUtilFunctions.getTimeZoneNameOfLocation(filteredCountryNames[index]),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.3,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 25,),
        ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('Back')),
      ],
    );
  }

  Future<void> confirmAddition(int index) async {
    await Flushbar(
      messageText: Text(
        "${filteredCountryNames[index]} was successfully set as primary location!",
        style: TextStyle(color: Color(0xff003c8f)),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Color(0xff48a999),
    ).show(context);
  }
}
