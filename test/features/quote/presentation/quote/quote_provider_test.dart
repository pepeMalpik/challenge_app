import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:challenge_app/features/quote/data/models/quote_response.dart';
import 'package:challenge_app/features/quote/domain/usecases/quote_usecase.dart';
import 'package:challenge_app/features/quote/presentation/providers/quote_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'quote_provider_test.mocks.dart';

@GenerateMocks([QuoteUsecase, LoadingProvider])
main() {
  group('quote_provider', () {
    test('fetch_quote_success', () async {
      final mockQuoteUsecase = MockQuoteUsecase();
      final mockLoadingProvider = MockLoadingProvider();
      final quoteResponse = quoteResponseFromJson(
          '{"success": {"total": 1},"contents": {"quotes": [{"quote": "You gotta commit. Youve gotta go out there and improvise and youve gotta be completely unafraid to die. Youve got to be able to take a chance to die. And you have to die lots. You have to die all the time.","length": "208","author": "Bill Murray","tags": ["commit","die","inspire"],"category": "inspire","language": "en","date": "2021-07-15","permalink": "https://theysaidso.com/quote/bill-murray-you-gotta-commit-youve-gotta-go-out-there-and-improvise-and-youve-go","id": "10b5AxFYQVLnO6ekInTdmAeF","background": "https://theysaidso.com/img/qod/qod-inspire.jpg","title": "Inspiring Quote of the day"}]},"baseurl": "https://theysaidso.com","copyright": {"year": 2023,"url": "https://theysaidso.com"}}');
      final expectedResponse = Future.value(quoteResponse);
      when(mockQuoteUsecase.execute())
          .thenAnswer((_) async => expectedResponse);
      when(mockLoadingProvider.showLoading(msg: 'fetching quote...'))
          .thenAnswer((realInvocation) => true);
      when(mockLoadingProvider.hideLoading())
          .thenAnswer((realInvocation) => true);
      final provider = Quoteprovider(
        quoteUsecase: mockQuoteUsecase,
        loadingProvider: mockLoadingProvider,
      );
      await provider.fetchQuote();
      expect(provider.quote?.data, await expectedResponse);
    });
  });
}
