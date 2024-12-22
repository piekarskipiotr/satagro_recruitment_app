import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:satagro_recruitment_app/utils/error_message_helper.dart';
import 'package:satagro_recruitment_app/utils/geolocation_helper.dart';
import 'package:uuid/uuid.dart';

part 'polygons_map_event.dart';

part 'polygons_map_state.dart';

class PolygonsMapBloc extends Bloc<PolygonsMapEvent, PolygonsMapState> {
  PolygonsMapBloc() : super(const PolygonsMapState()) {
    on<RequestLocalizationPermission>(_onRequestLocalizationPermission);
    on<InitializeGoogleMapController>(_onInitializeGoogleMapController);
    on<UpdateGoogleMapCameraPositionToCurrentLocation>(_onUpdateGoogleMapCameraPositionToCurrentLocation);
    on<AddPolygonPoint>(_onAddPolygonPoint);
    on<SavePolygon>(_onSavePolygon);
    on<RemovePolygon>(_onRemovePolygon);
    on<UndoLastPolygonPoint>(_onUndoLastPolygonPoint);

    add(const RequestLocalizationPermission());
  }

  /*
    Due to Android limitations, it is necessary to request location permissions before generating Google Maps widgets.
    This ensures that the user's current location is displayed correctly, as failing to obtain the permission
    beforehand can result in the map not showing the updated user location.
   */
  Future<void> _onRequestLocalizationPermission(
    RequestLocalizationPermission event,
    Emitter<PolygonsMapState> emit,
  ) async {
    try {
      /*
        For simplicity's sake I have made that in case of lack of localization permissions or problems
        with the location service an error will be thrown, which will be handled later so that
        the map is not displayed
       */
      await GeolocationHelper.checkPermissionStatus();
      emit(state.copyWith(isLocalizationPermissionGranted: true));
    } catch (error) {
      emit(state.copyWith(error: ErrorMessageHelper.parseError(error)));
    }
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

  Future<void> _onAddPolygonPoint(AddPolygonPoint event, Emitter<PolygonsMapState> emit) async {
    final position = event.position;
    final polygonPoints = [...?state.polygonPoints, position];
    emit(state.copyWith(polygonPoints: polygonPoints));
  }

  Future<void> _onSavePolygon(SavePolygon event, Emitter<PolygonsMapState> emit) async {
    final polygonPoints = [...?state.polygonPoints];
    if (polygonPoints.length < 3) return;

    final polygon = Polygon(
      polygonId: PolygonId(const Uuid().v4()),
      points: polygonPoints,
      fillColor: _generateRandomColor(),
      strokeWidth: 2,
    );

    final polygons = {...?state.polygons, polygon};
    emit(state.copyWith(polygons: polygons, polygonPoints: []));
  }

  Future<void> _onUndoLastPolygonPoint(UndoLastPolygonPoint event, Emitter<PolygonsMapState> emit) async {
    final polygonPoints = [...?state.polygonPoints];
    if (polygonPoints.isNotEmpty) emit(state.copyWith(polygonPoints: polygonPoints..removeLast()));
  }

  Future<void> _onRemovePolygon(RemovePolygon event, Emitter<PolygonsMapState> emit) async {
    emit(state.copyWith(polygonPoints: []));
  }

  Color _generateRandomColor() {
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    final alpha = (255 * 0.6).toInt();
    return Color.fromARGB(alpha, red, green, blue);
  }
}
