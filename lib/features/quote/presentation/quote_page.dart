import 'package:challenge_app/core/routes/app_routes.dart';
import 'package:challenge_app/core/widgets/custom_loading.dart';
import 'package:challenge_app/features/quote/presentation/providers/quote_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<Quoteprovider>(context, listen: false);
      provider.fetchQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Quoteprovider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Frase del día'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: CustomLoading(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    provider.quote?.data?.contents.quotes[0].quote ?? '',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
