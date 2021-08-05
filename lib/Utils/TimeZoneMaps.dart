import 'package:customclockapp/Utils/LocationTimeZoneCategories.dart';

class TimeZoneMaps {
  
  static Map<String,String> mapForTzMethod = {
    'India':'Asia/Kolkata',
    'Germany': 'Europe/Berlin',
    'England': 'Europe/London',
    'Japan' : 'Asia/Tokyo',
    'Spain': 'Europe/Madrid',
    'Singapore' : 'Asia/Singapore',
    'France': 'Europe/Paris',
    'China': 'Asia/Hong_Kong'
  };

  static Map<String,String> mapForTimeZoneNameSummer = {
    'India':'Indian Standard Time',
    'Germany': 'Central European Summer Time',
    'England': 'British Summer Time',
    'Spain': 'Central European Summer Time',
    'France': 'Central European Summer Time',
    'China': 'China Standard Time',
    'Japan' : 'Japan Standard Time',
    'Singapore' : 'Singapore Standard Time'
  };

  static Map<String,String> mapForTimeZoneNameWinter = {
    'India':'Indian Standard Time',
    'Germany': 'Central European Time',
    'England': 'Greenwich Mean Time',
    'Spain': 'Central European Time',
    'France': 'Central European Time',
    'China': 'China Standard Time',
    'Japan' : 'Japan Standard Time',
    'Singapore' : 'Singapore Standard Time'
  };

  static Map<String,LocationTimeZoneCategories> mapCountryToTimeZoneCategory = {
    'India':LocationTimeZoneCategories.noDaylightSavings,
    'Germany': LocationTimeZoneCategories.mostOfEurope,
    'England': LocationTimeZoneCategories.mostOfEurope,
    'Japan' : LocationTimeZoneCategories.noDaylightSavings,
    'Spain': LocationTimeZoneCategories.mostOfEurope,
    'Singapore' : LocationTimeZoneCategories.noDaylightSavings,
    'France': LocationTimeZoneCategories.mostOfEurope,
    'China': LocationTimeZoneCategories.noDaylightSavings
  };

  static bool isSummerEurope()
  {
    //TODO
    return true;
  }
}