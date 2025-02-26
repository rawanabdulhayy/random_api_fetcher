import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:random_api_fetce/constants/strings.dart';

class QuotesWebService {
  Future<List<dynamic>> getRandomQuote({
    int? maxLength,
    int? minLength,
    String? tags,
    String? author,
  }) async {
    try {
      final queryParams = {
        if (maxLength != null) 'maxLength': maxLength.toString(),
        if (minLength != null) 'minLength': minLength.toString(),
        if (tags != null) 'tags': tags,
        if (author != null) 'author': author,
      };

      final uri = Uri.parse(quoteBaseURL).replace(queryParameters: queryParams);
      final response = await http.get(
        uri,
        headers: {
          'X-Api-Key': dotenv.env['API_KEY'] ?? '',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return [data as Map<String, dynamic>];
        //listing the single json object returned

      } else {
        throw Exception('Failed to load quotes');
      }
    } catch (e) {
      print('Error fetching API data: $e');
      return [];
    }
  }
}
