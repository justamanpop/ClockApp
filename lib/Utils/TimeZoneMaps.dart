import 'package:customclockapp/Utils/CountryTimeZoneCategories.dart';

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

  static Map<String,CountryTimeZoneCategories> mapCountryToTZCategory = {
    'India':CountryTimeZoneCategories.noDaylightSavings,
    'Germany': CountryTimeZoneCategories.europe,
    'England': CountryTimeZoneCategories.europe,
    'Japan' : CountryTimeZoneCategories.noDaylightSavings,
    'Spain': CountryTimeZoneCategories.europe,
    'Singapore' : CountryTimeZoneCategories.noDaylightSavings,
    'France': CountryTimeZoneCategories.europe,
    'China': CountryTimeZoneCategories.noDaylightSavings
  };

  static bool isSummerEurope()
  {
    //TODO
    return true;
  }
}