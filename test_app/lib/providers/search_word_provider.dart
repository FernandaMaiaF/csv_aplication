import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SearchWordProvider {
  static Future<String?> countWordOcurrency({
    required String word,
  }) async {
    const backendUrl = 'localhost';
    Uri url = Uri.http(
      backendUrl,
      '/csv_aplication/organizer.php/find-word',
      {
        'word': word,
      },
    );
    String? ocurrencyTemp;
    try {
      final response = await http.get(
        url,
      );
      if (kDebugMode) print('Response status: ${response.statusCode}');
      if (kDebugMode) print('Response body: ${response.body}');
      final responseData = response.body;
      ocurrencyTemp = responseData.replaceAll(' ', '');
    } catch (error) {
      String errorMsg = error.toString();
      if (kDebugMode) print(errorMsg);
    }

    return ocurrencyTemp;
  }
}
