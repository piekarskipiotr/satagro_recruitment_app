import 'package:flutter/material.dart';

class PolygonsMapLoadingView extends StatelessWidget {
  const PolygonsMapLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
