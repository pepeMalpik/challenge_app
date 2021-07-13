import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/features/home/data/models/quote_response.dart';
import 'package:challenge_app/features/home/domain/repositories/quote_repository.dart';

class QuoteUsecase {
  QuoteRepository quoteRepository;

  QuoteUsecase({required this.quoteRepository});

  Future<QuoteResponse> execute() {
    return this.quoteRepository.fetchQuote();
  }
}
