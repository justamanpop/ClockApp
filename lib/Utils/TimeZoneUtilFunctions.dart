import 'package:customclockapp/Utils/LocationTimeZoneCategories.dart';
import 'package:customclockapp/Utils/TimeZoneMaps.dart';

class TimeZoneUtilFunctions {

  static String getTimeZoneNameOfLocation(String locationName)
  {
    if(TimeZoneMaps.mapCountryToTimeZoneCategory[locationName] == LocationTimeZoneCategories.noDaylightSavings)
      return TimeZoneMaps.mapForTimeZoneNameSummer[locationName];

    if(TimeZoneMaps.mapCountryToTimeZoneCategory[locationName] == LocationTimeZoneCategories.mostOfEurope){
      if(isSummerMostOfEurope())
        return TimeZoneMaps.mapForTimeZoneNameSummer[locationName];

      else
        return TimeZoneMaps.mapForTimeZoneNameWinter[locationName];
    }
  }

  static bool isSummerMostOfEurope()
  {
    DateTime lastSundayMarch = _getLastSundayOfMonth(3);
    DateTime lastSundayOctober = _getLastSundayOfMonth(10);

    DateTime now = DateTime.now();

    if(now.compareTo(lastSundayMarch)>=0 && now.compareTo(lastSundayOctober)<=0)
      return true;

    return false;
  }

  static DateTime _getLastSundayOfMonth(int month) {
    DateTime now = DateTime.now();
    DateTime d1 = DateTime(now.year,month,31);

    while(d1.weekday != 7)
    {
      d1 = d1.subtract(Duration(days: 1));
    }

    return d1;
  }

}