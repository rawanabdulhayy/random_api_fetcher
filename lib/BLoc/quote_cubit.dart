import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_api_fetce/data/models/quote.dart';
import 'package:random_api_fetce/data/repositories/quote_repo.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteRepository quoteRepository;
  List<Quote> quote = [];
  QuoteCubit({required this.quoteRepository}) : super(QuoteInitial());

  void getRandomQuote() {
    quoteRepository.getRandomQuote().then((fetchedQuote) {
      this.quote = fetchedQuote;
      emit(QuoteLoaded(quote: quote));
    });
  }
}
