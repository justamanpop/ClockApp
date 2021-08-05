import 'dart:collection';
import 'package:customclockapp/main.dart';

class UserPreferences {
  
  static LinkedHashSet<String> savedCountries = prefs.getStringList('savedCountries').toSet();

  static String currCountry = prefs.getString('currCountry');
}