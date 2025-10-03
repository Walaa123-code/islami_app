import 'package:intl/intl.dart';
import 'package:islami_n/features/time/data/time_model.dart';

class DateFormatter {
  static String formatGregorian(Gregorian date) {
    return '${date.day!} ${date.month!.en!.substring(0, 3)}\n${date.year!}';
  }

  static String formatHijri(Hijri date) {
    return '${date.day!} ${date.month!.en!.substring(0, 3)}\n${date.year!}';
  }
}

class TimeConverter {
  static String to12Hour(String time) {
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    return DateFormat("hh:mm\n  a").format(dateTime);
  }
}

class PrayerTime {
  static Map<String, dynamic> sortPrayerTimes(
      Map<String, dynamic> prayerTimes) {
    DateTime now = DateTime.now();

    var sortedEntries = prayerTimes.entries.toList()
      ..sort((MapEntry<String, dynamic> a, MapEntry<String, dynamic> b) {
        DateTime timeA = DateFormat("HH:mm").parse(a.value);
        DateTime timeB = DateFormat("HH:mm").parse(b.value);

        DateTime dateTimeA =
            DateTime(now.year, now.month, now.day, timeA.hour, timeA.minute);
        DateTime dateTimeB =
            DateTime(now.year, now.month, now.day, timeB.hour, timeB.minute);

        if (dateTimeA.isBefore(now)) {
          dateTimeA = dateTimeA.add(const Duration(days: 1));
        }

        if (dateTimeB.isBefore(now)) {
          dateTimeB = dateTimeB.add(const Duration(days: 1));
        }

        return dateTimeA.compareTo(dateTimeB);
      });

    return Map<String, dynamic>.fromEntries(sortedEntries);
  }

  static Map<String, Duration> getNextPraterCountDown(
      Map<String, dynamic> prayerTimes) {
    DateTime now = DateTime.now();
    Map<String, Duration> timeDifference = {};
    prayerTimes.forEach(
      (name, timeString) {
        DateTime prayerTimes = DateFormat("HH:mm").parse(timeString);
        DateTime prayerDateTime = DateTime(
            now.year, now.month, now.day, prayerTimes.hour, prayerTimes.minute);
        if (prayerDateTime.isBefore(now)) {
          prayerDateTime.add(const Duration(days: 1));
        }
        Duration difference = prayerDateTime.difference(now);
        timeDifference[name] = difference;
      },
    );
    return timeDifference;
  }
}
