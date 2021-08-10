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
    'China': 'Asia/Hong_Kong',
    'Turkey': 'Europe/Istanbul',
    'Malaysia' : 'Asia/Kuala_Lumpur',
    'Netherlands' : 'Europe/Amsterdam',
    'South Africa' : 'Africa/Johannesburg',
    'Pakistan' : 'Asia/Karachi',
    'Sri Lanka' : 'Asia/Colombo'
  };

  static Map<String,String> mapForTimeZoneNameSummer = {
    'India':'Indian Standard Time',
    'Germany': 'Central European Summer Time',
    'England': 'British Summer Time',
    'Spain': 'Central European Summer Time',
    'France': 'Central European Summer Time',
    'China': 'China Standard Time',
    'Japan' : 'Japan Standard Time',
    'Singapore' : 'Singapore Standard Time',
    'Turkey' : 'Turkey Time',
    'Malaysia': 'Malaysian Standard Time',
    'Netherlands' : 'Central European Summer Time',
    'South Africa' : 'South Africa Standard Time',
    'Pakistan' : 'Pakistan Standard Time',
    'Sri Lanka' : 'Sri Lanka Standard Time'
  };

  static Map<String,String> mapForTimeZoneNameWinter = {
    'India':'Indian Standard Time',
    'Germany': 'Central European Time',
    'England': 'Greenwich Mean Time',
    'Spain': 'Central European Time',
    'France': 'Central European Time',
    'China': 'China Standard Time',
    'Japan' : 'Japan Standard Time',
    'Singapore' : 'Singapore Standard Time',
    'Turkey' : 'Turkey Time',
    'Malaysia': 'Malaysian Standard Time',
    'Netherlands': 'Central European Time',
    'South Africa' : 'South Africa Standard Time',
    'Pakistan' : 'Pakistan Standard Time',
    'Sri Lanka' : 'Sri Lanka Standard Time'
  };

  static Map<String,LocationTimeZoneCategories> mapCountryToTimeZoneCategory = {
    'India':LocationTimeZoneCategories.noDaylightSavings,
    'Germany': LocationTimeZoneCategories.mostOfEurope,
    'England': LocationTimeZoneCategories.mostOfEurope,
    'Japan' : LocationTimeZoneCategories.noDaylightSavings,
    'Spain': LocationTimeZoneCategories.mostOfEurope,
    'Singapore' : LocationTimeZoneCategories.noDaylightSavings,
    'France': LocationTimeZoneCategories.mostOfEurope,
    'China': LocationTimeZoneCategories.noDaylightSavings,
    'Turkey': LocationTimeZoneCategories.noDaylightSavings,
    'Malaysia' : LocationTimeZoneCategories.noDaylightSavings,
    'Netherlands' : LocationTimeZoneCategories.mostOfEurope,
    'South Africa' : LocationTimeZoneCategories.noDaylightSavings,
    'Pakistan' : LocationTimeZoneCategories.noDaylightSavings,
    'Sri Lanka' : LocationTimeZoneCategories.noDaylightSavings
  };

}