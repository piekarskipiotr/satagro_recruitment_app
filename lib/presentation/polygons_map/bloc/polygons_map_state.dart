part of 'polygons_map_bloc.dart';

class PolygonsMapState extends Equatable {
  const PolygonsMapState({
    this.googleMapController,
    this.error,
  });

  final GoogleMapController? googleMapController;
  final String? error;

  PolygonsMapState copyWith({
    GoogleMapController? googleMapController,
    String? error,
  }) {
    return PolygonsMapState(
      googleMapController: googleMapController ?? this.googleMapController,
      error: error,
    );
  }

  @override
  List<Object?> get props => [googleMapController, error];
}
