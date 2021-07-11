import 'package:challenge_app/core/providers/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomLoading extends StatelessWidget {
  final Widget child;
  const CustomLoading({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoadingProvider>(context);
    return Container(
      child: IndexedStack(
        index: (provider.isLoading) ? 0 : 1,
        children: [
          (provider.isLoading) ? LoadingPage() : Container(),
          child,
        ],
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.4),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
