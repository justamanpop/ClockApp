import 'dart:async';

import 'package:flutter/material.dart';
import 'package:customclockapp/Pages/CurrentTime.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

void main() async{

  await runZonedGuarded(
        () async {
      WidgetsFlutterBinding.ensureInitialized();

      prefs = await SharedPreferences.getInstance();

      //if currCountry doesn't exist in shared prefs
      if(!prefs.containsKey('currCountry'))
      {
        debugPrint('FIRST TIME CURR COUNTRY');
        prefs.setString('currCountry', 'India');
      }

      //if savedCountries doesn't exist in shared prefs
      if(!prefs.containsKey('savedCountries'))
      {
        debugPrint('FIRST TIME SAVED COUNTRIES');
        prefs.setStringList('savedCountries', []);
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



