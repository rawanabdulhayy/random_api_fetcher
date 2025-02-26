import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:random_api_fetce/data/models/quote.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit() : super(QuoteInitial());
}
