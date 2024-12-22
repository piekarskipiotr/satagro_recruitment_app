import 'package:flutter/material.dart';
import 'package:satagro_recruitment_app/presentation/polygons_map/widgets/polygons_map_fab_buttons/polygon_map_fab_button.dart';

class PolygonsMapFabButtonsView extends StatelessWidget {
  const PolygonsMapFabButtonsView({
    required this.onSavePolygon,
    required this.onRemovePolygon,
    required this.onUndoLastPolygonPoint,
    super.key,
  });

  final VoidCallback onSavePolygon;
  final VoidCallback onRemovePolygon;
  final VoidCallback onUndoLastPolygonPoint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PolygonMapFabButton(icon: Icons.save_rounded, heroTag: 'save', onPressed: onSavePolygon),
          const SizedBox(height: 16),
          PolygonMapFabButton(icon: Icons.remove_circle_rounded, heroTag: 'remove', onPressed: onRemovePolygon),
          const SizedBox(height: 16),
          PolygonMapFabButton(icon: Icons.undo_rounded, heroTag: 'undo', onPressed: onUndoLastPolygonPoint),
        ],
      ),
    );
  }
}
