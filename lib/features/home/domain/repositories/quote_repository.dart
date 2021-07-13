import 'package:challenge_app/features/home/data/models/quote_response.dart';

abstract class QuoteRepository {
  Future<QuoteResponse> fetchQuote();
}
