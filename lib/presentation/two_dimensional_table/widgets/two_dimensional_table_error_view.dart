import 'package:flutter/material.dart';

class TwoDimensionalTableErrorView extends StatelessWidget {
  const TwoDimensionalTableErrorView({required this.error, super.key});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(error, textAlign: TextAlign.center),
      ),
    );
  }
}
