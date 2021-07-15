import 'package:challenge_app/features/quote/data/models/quote_response.dart';

abstract class QuoteRepository {
  Future<QuoteResponse> fetchQuote();
}
