part of 'quote_cubit.dart';

@immutable
sealed class QuoteState {}
final class QuoteInitial extends QuoteState {}
final class QuoteLoading extends QuoteState {}
final class QuoteLoaded extends QuoteState {
  List <Quote> quote = [];
  QuoteLoaded({required this.quote});
}
