part of 'polygons_map_bloc.dart';

class PolygonsMapState extends Equatable {
  const PolygonsMapState({
    this.googleMapController,
    this.polygons,
    this.polygonPoints,
    this.error,
  });

  final GoogleMapController? googleMapController;
  final Set<Polygon>? polygons;
  final List<LatLng>? polygonPoints;
  final String? error;

  PolygonsMapState copyWith({
    GoogleMapController? googleMapController,
    Set<Polygon>? polygons,
    List<LatLng>? polygonPoints,
    String? error,
  }) {
    return PolygonsMapState(
      googleMapController: googleMapController ?? this.googleMapController,
      polygons: polygons ?? this.polygons,
      polygonPoints: polygonPoints ?? this.polygonPoints,
      error: error,
    );
  }

  @override
  List<Object?> get props => [googleMapController, polygons, polygonPoints, error];
}
