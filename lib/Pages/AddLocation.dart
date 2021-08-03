import 'package:customclockapp/Utils/TimeZoneUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

class AddLocation extends StatefulWidget {
  const AddLocation({Key key}) : super(key: key);

  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  TextEditingController searchBarController = TextEditingController();

  final List<String> allCountryNames =
      TimeZoneUtils.mapForTzMethod.keys.toList();
  List<String> filteredCountryNames;

  final DateFormat formatterNoSeconds = DateFormat('Hm');

  @override
  void initState() {
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
                    filteredCountryNames = allCountryNames.where((countryName) => countryName.toLowerCase().contains(val.toLowerCase())).toList();
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
        Card(
          color: Colors.black,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                thickness: 0.3,
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: filteredCountryNames.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('flags/${filteredCountryNames[index]}.png'),
                  radius: 25,
                ),
                title: Text(
                  '${filteredCountryNames[index]}  ${formatterNoSeconds.format(tz.TZDateTime.now(tz.getLocation(TimeZoneUtils.mapForTzMethod[filteredCountryNames[index]])))}',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  TimeZoneUtils.isSummerEurope()
                      ? TimeZoneUtils
                          .mapForTimeZoneNameSummer[filteredCountryNames[index]]
                      : TimeZoneUtils.mapForTimeZoneNameWinter[
                          filteredCountryNames[index]],
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.3,
        ),
      ],
    );
  }
}
