import 'dart:collection';
import 'package:customclockapp/main.dart';

class UserPreferences {
  
  static LinkedHashSet<String> savedLocations = prefs.getStringList('savedLocations').toSet();

  static String currLocation = prefs.getString('currLocation');
}