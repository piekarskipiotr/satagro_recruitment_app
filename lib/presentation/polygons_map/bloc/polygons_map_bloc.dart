import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:satagro_recruitment_app/utils/error_message_helper.dart';
import 'package:satagro_recruitment_app/utils/geolocation_helper.dart';

part 'polygons_map_event.dart';

part 'polygons_map_state.dart';

class PolygonsMapBloc extends Bloc<PolygonsMapEvent, PolygonsMapState> {
  PolygonsMapBloc() : super(const PolygonsMapState()) {
    on<InitializeGoogleMapController>(_onInitializeGoogleMapController);
    on<UpdateGoogleMapCameraPositionToCurrentLocation>(_onUpdateGoogleMapCameraPositionToCurrentLocation);
  }

  Future<void> _onInitializeGoogleMapController(
    InitializeGoogleMapController event,
    Emitter<PolygonsMapState> emit,
  ) async {
    final googleMapController = event.googleMapController;
    emit(state.copyWith(googleMapController: googleMapController));

    // After initializing controller set camera position to user current location
    add(const UpdateGoogleMapCameraPositionToCurrentLocation());
  }

  Future<void> _onUpdateGoogleMapCameraPositionToCurrentLocation(
    UpdateGoogleMapCameraPositionToCurrentLocation event,
    Emitter<PolygonsMapState> emit,
  ) async {
    try {
      /*
        For simplicity's sake I have made that in case of lack of localization permissions or problems
        with the location service an error will be thrown, which will be handled later so that
        the map is not displayed
       */
      await GeolocationHelper.checkPermissionStatus();
      final currentLocation = await GeolocationHelper.getCurrentLocation();
      final cameraPosition = CameraPosition(
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 14,
      );

      final googleMapController = state.googleMapController;
      await googleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    } catch (error) {
      emit(state.copyWith(error: ErrorMessageHelper.parseError(error)));
    }
  }
}
