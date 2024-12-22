part of 'polygons_map_bloc.dart';

class PolygonsMapState extends Equatable {
  const PolygonsMapState({
    this.isLocalizationPermissionGranted = false,
    this.googleMapController,
    this.polygons,
    this.polygonPoints,
    this.error,
  });

  final bool isLocalizationPermissionGranted;
  final GoogleMapController? googleMapController;
  final Set<Polygon>? polygons;
  final List<LatLng>? polygonPoints;
  final String? error;

  PolygonsMapState copyWith({
    bool? isLocalizationPermissionGranted,
    GoogleMapController? googleMapController,
    Set<Polygon>? polygons,
    List<LatLng>? polygonPoints,
    String? error,
  }) {
    return PolygonsMapState(
      isLocalizationPermissionGranted: isLocalizationPermissionGranted ?? this.isLocalizationPermissionGranted,
      googleMapController: googleMapController ?? this.googleMapController,
      polygons: polygons ?? this.polygons,
      polygonPoints: polygonPoints ?? this.polygonPoints,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLocalizationPermissionGranted, googleMapController, polygons, polygonPoints, error];
}
