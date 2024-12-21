import 'package:flutter/material.dart';

class TwoDimensionalTableDataDefaultView extends StatelessWidget {
  const TwoDimensionalTableDataDefaultView({this.value, super.key});

  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        value.toString(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
