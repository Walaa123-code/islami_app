import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islami_n/features/time/data/time_model.dart';

class TimeData {
  static Future<TimeModel> getTimeData() async {
    try {
      String date = DateFormat("dd-MM-yyyy").format(DateTime.now());
      Uri uri = Uri.parse(
          "https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return TimeModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }
}
