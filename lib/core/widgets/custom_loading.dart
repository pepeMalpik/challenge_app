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
      child: Stack(
        children: [
          child,
          (provider.isLoading) ? LoadingPage() : Container(),
        ],
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
