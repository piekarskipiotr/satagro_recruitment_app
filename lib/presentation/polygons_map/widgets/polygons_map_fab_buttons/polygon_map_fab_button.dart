import 'package:flutter/material.dart';

class PolygonMapFabButton extends StatelessWidget {
  const PolygonMapFabButton({
    required this.icon,
    required this.heroTag,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String heroTag;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: Colors.white,
      child: Icon(icon, color: Colors.black.withOpacity(0.6)),
    );
  }
}
