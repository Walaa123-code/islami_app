import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islami_n/features/radio/data/radio_model.dart';

import 'Reciters_model.dart';

class RadioData {
  static Future<RadioModel> getRadioData() async {
    try {
      Uri uri = Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
      http.Response response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RadioModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }

  static Future<RecitersModel> getRecitersData() async {
    try {
      Uri uri =
          Uri.parse("https://www.mp3quran.net/api/v3/reciters?language=ar");
      http.Response response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RecitersModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }
}
