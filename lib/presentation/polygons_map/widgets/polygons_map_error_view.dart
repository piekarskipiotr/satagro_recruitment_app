import 'package:flutter/material.dart';

class PolygonsMapErrorView extends StatelessWidget {
  const PolygonsMapErrorView({required this.error, super.key});

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
