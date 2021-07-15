import 'package:challenge_app/features/quote/data/models/quote_response.dart';
import 'package:challenge_app/features/quote/domain/repositories/quote_repository.dart';
import 'package:challenge_app/features/quote/domain/services/quote_service.dart';

class QuoteRepositoryImp extends QuoteRepository {
  QuoteService quoteService;

  QuoteRepositoryImp({required this.quoteService});

  @override
  Future<QuoteResponse> fetchQuote() async {
    final jsonResponse = await quoteService.fetchQuote();
    final response = quoteResponseFromJson(jsonResponse);
    return response;
  }
}
