import 'dart:async';
import 'package:flutter/material.dart';
import 'package:customclockapp/Pages/WorldClock/CurrentTime.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

void main() async{

  await runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();

      prefs = await SharedPreferences.getInstance();

      //if currCountry doesn't exist in shared prefs
      if(!prefs.containsKey('currLocation'))
      {
        prefs.setString('currLocation', 'India');
      }

      //if savedCountries doesn't exist in shared prefs
      if(!prefs.containsKey('savedLocations'))
      {
        prefs.setStringList('savedLocations', []);
      }

      //if time display format doesn't exist in shared prefs
      if(!prefs.containsKey('is24Hour'))
      {
        prefs.setBool('is24Hour', true);
      }

      runApp(MaterialApp(
        title: 'CLock App',
        home:CurrentTime(),
        debugShowCheckedModeBanner: false,
      ));
    },
        (error, st) => print(error),
  );



}



