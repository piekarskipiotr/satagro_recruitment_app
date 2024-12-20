import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonMapGoogleMapView extends StatelessWidget {
  const PolygonMapGoogleMapView({
    required this.onMapCreated,
    required this.onAddPolygonPoint,
    required this.polygons,
    required this.polygonPoints,
    super.key,
  });

  final void Function(GoogleMapController) onMapCreated;
  final void Function(LatLng) onAddPolygonPoint;
  final Set<Polygon> polygons;
  final List<LatLng> polygonPoints;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      padding: const EdgeInsets.only(right: 16, bottom: 24),
      initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
      myLocationEnabled: true,
      polygons: polygons,
      polylines: {
        if (polygonPoints.length > 1)
          Polyline(
            polylineId: const PolylineId('polygon_drawer_id'),
            points: polygonPoints,
            color: Colors.blue,
            width: 2,
          ),
      },
      onMapCreated: onMapCreated,
      onTap: onAddPolygonPoint,
    );
  }
}
