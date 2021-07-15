import 'package:challenge_app/features/quote/data/models/quote_response.dart';
import 'package:challenge_app/features/quote/domain/repositories/quote_repository.dart';

class QuoteUsecase {
  QuoteRepository quoteRepository;

  QuoteUsecase({required this.quoteRepository});

  Future<QuoteResponse> execute() {
    return this.quoteRepository.fetchQuote();
  }
}
