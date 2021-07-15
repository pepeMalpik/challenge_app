import 'package:challenge_app/core/data/api_response.dart';
import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:challenge_app/features/quote/data/models/quote_response.dart';
import 'package:challenge_app/features/quote/domain/usecases/quote_usecase.dart';
import 'package:flutter/material.dart';

class Quoteprovider with ChangeNotifier {
  LoadingProvider loadingProvider;
  QuoteUsecase quoteUsecase;

  ApiResponse<QuoteResponse>? _quote;
  ApiResponse<QuoteResponse>? get quote => _quote;

  Quoteprovider({required this.quoteUsecase, required this.loadingProvider});

  fetchQuote() async {
    this.loadingProvider.showLoading(msg: 'fetching quote...');
    try {
      final quote = await this.quoteUsecase.execute();
      this._quote = ApiResponse.completed(quote);
      notifyListeners();
    } catch (e) {
      this._quote = ApiResponse.error('error fetching quote...');
      notifyListeners();
    }
    this.loadingProvider.hideLoading();
  }
}
