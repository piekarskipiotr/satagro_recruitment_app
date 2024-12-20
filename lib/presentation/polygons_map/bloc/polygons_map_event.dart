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

final class AddPolygonPoint extends PolygonsMapEvent {
  const AddPolygonPoint(this.position);

  final LatLng position;

  @override
  List<Object?> get props => [position];
}

final class SavePolygon extends PolygonsMapEvent {
  const SavePolygon();

  @override
  List<Object?> get props => [];
}

final class RemovePolygon extends PolygonsMapEvent {
  const RemovePolygon();

  @override
  List<Object?> get props => [];
}

final class UndoLastPolygonPoint extends PolygonsMapEvent {
  const UndoLastPolygonPoint();

  @override
  List<Object?> get props => [];
}
