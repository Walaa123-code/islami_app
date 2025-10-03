import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_n/features/time/view/widget/askar/data/askar_model.dart';

class AzkarData {
  static Future<AzkarModel> getAzkarData() async {
    try {
      Uri uri = Uri.parse(
        "https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json",
      );

      final response = await http.get(uri);
      print('status: ${response.statusCode}');
      final body = response.body;
      print(
          'body: ${body.substring(0, body.length < 200 ? body.length : 200)}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(body);
        return AzkarModel.fromJson(jsonResponse);
      } else {
        throw Exception("Failed to load azkar data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching azkar data: $e");
    }
  }
}
