import 'package:flutter/material.dart';

class HomeNavigationButton extends StatelessWidget {
  const HomeNavigationButton({required this.label, required this.page, super.key});

  final String label;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (context) => page),
        );
      },
      child: Text(label),
    );
  }
}
