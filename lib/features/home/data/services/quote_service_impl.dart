import 'package:challenge_app/core/data/api_path.dart';
import 'package:challenge_app/core/data/http_client.dart';
import 'package:challenge_app/features/home/domain/services/quote_service.dart';

class QuoteServiceImpl extends QuoteService {
  HttpClient httpClient;

  QuoteServiceImpl({required this.httpClient});

  @override
  Future<String> fetchQuote() {
    return this
        .httpClient
        .fetchData(APIPathHelper.getValue(APIPath.fetch_quote));
  }
}
