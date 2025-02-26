import 'package:random_api_fetce/data/web_services/quotes_web_service.dart';

import '../models/quote.dart';

class QuoteRepository {
  QuotesWebService quotesWebService;

  QuoteRepository({required this.quotesWebService});

  Future<List<Quote>> getRandomQuote() async{
    final quote = await quotesWebService.getRandomQuote();
    return quote.map((quote) => Quote.fromJson(quote)).toList();
  }
}