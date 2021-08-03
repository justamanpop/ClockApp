class TimeZoneUtils {
  static Map<String,String> mapForTzMethod = {
    'India':'Asia/Kolkata',
    'Germany': 'Europe/Berlin',
    'England': 'Europe/London',
    'Spain': 'Europe/Madrid',
    'France': 'Europe/Paris',
    'China': 'Asia/Hong_Kong'
  };

  static Map<String,String> mapForTimeZoneNameSummer = {
    'India':'Indian Standard Time',
    'Germany': 'Central European Summer Time',
    'England': 'British Summer Time',
    'Spain': 'Central European Summer Time',
    'France': 'Central European Summer Time',
    'China': 'China Standard Time'
  };

  static Map<String,String> mapForTimeZoneNameWinter = {
    'India':'Indian Standard Time',
    'Germany': 'Central European Time',
    'England': 'Greenwich Mean Time',
    'Spain': 'Central European Time',
    'France': 'Central European Time',
    'China': 'China Standard Time'
  };

  static bool isSummerEurope()
  {
    //TODO
    return true;
  }
}