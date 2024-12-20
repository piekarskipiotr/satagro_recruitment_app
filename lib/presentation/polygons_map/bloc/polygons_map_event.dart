part of 'polygons_map_bloc.dart';

abstract class PolygonsMapEvent extends Equatable {
  const PolygonsMapEvent();
}

final class InitializeGoogleMapController extends PolygonsMapEvent {
  const InitializeGoogleMapController(this.googleMapController);

  final GoogleMapController googleMapController;

  @override
  List<Object?> get props => [googleMapController];
}

final class UpdateGoogleMapCameraPositionToCurrentLocation extends PolygonsMapEvent {
  const UpdateGoogleMapCameraPositionToCurrentLocation();

  @override
  List<Object?> get props => [];
}
