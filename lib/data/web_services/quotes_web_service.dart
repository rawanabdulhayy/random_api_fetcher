import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:random_api_fetce/constants/strings.dart';

class QuotesWebService {
  Future<List<dynamic>> getRandomQuote() async {
    try {
      final uri = Uri.parse(quoteBaseURL);
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'X-Api-Key': dotenv.env['API_KEY'] ?? '', // Ensure API key is loaded
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is List) {
          return data;
        } else if (data is Map<String, dynamic>) {
          if (data.containsKey("results") && data["results"] is List) {
            return data["results"] as List<dynamic>;
          }
          return [data];
        } else {
          throw Exception("Unexpected API response format");
        }
      } else {
        throw Exception("Failed to fetch quotes. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print('Error fetching API data: $e');
      return [];
    }
  }
}
