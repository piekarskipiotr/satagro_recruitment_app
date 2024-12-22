import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:satagro_recruitment_app/presentation/polygons_map/bloc/polygons_map_bloc.dart';
import 'package:satagro_recruitment_app/presentation/polygons_map/widgets/widgets.dart';

class PolygonsMapView extends StatelessWidget {
  const PolygonsMapView({super.key});

  void _initializeGoogleMapController(BuildContext context, GoogleMapController googleMapController) {
    context.read<PolygonsMapBloc>().add(InitializeGoogleMapController(googleMapController));
  }

  void _addPolygonPoint(BuildContext context, LatLng position) {
    context.read<PolygonsMapBloc>().add(AddPolygonPoint(position));
  }

  void _savePolygon(BuildContext context) {
    context.read<PolygonsMapBloc>().add(const SavePolygon());
  }

  void _removePolygon(BuildContext context) {
    context.read<PolygonsMapBloc>().add(const RemovePolygon());
  }

  void _undoLastPolygonPoint(BuildContext context) {
    context.read<PolygonsMapBloc>().add(const UndoLastPolygonPoint());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PolygonsMapBloc, PolygonsMapState>(
      builder: (context, state) {
        final error = state.error;
        final isError = error != null && error.isNotEmpty;
        final isLocalizationPermissionGranted = state.isLocalizationPermissionGranted;

        return Scaffold(
          body: SafeArea(
            child: _buildContentView(
              context: context,
              state: state,
              error: error,
              isError: isError,
              isLocalizationPermissionGranted: isLocalizationPermissionGranted,
            ),
          ),
          floatingActionButton: isError || !isLocalizationPermissionGranted
              ? null
              : PolygonsMapFabButtonsView(
                  onSavePolygon: () {
                    _savePolygon(context);
                  },
                  onRemovePolygon: () {
                    _removePolygon(context);
                  },
                  onUndoLastPolygonPoint: () {
                    _undoLastPolygonPoint(context);
                  },
                ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        );
      },
    );
  }

  Widget _buildContentView({
    required BuildContext context,
    required PolygonsMapState state,
    required String? error,
    required bool isError,
    required bool isLocalizationPermissionGranted,
  }) {
    if (isError) return PolygonsMapErrorView(error: error ?? '');
    if (!isLocalizationPermissionGranted) return const PolygonsMapLoadingView();

    final polygons = {...?state.polygons};
    final polygonPoints = [...?state.polygonPoints];

    return PolygonsMapGoogleMapView(
      polygons: polygons,
      polygonPoints: polygonPoints,
      onAddPolygonPoint: (position) {
        _addPolygonPoint(context, position);
      },
      onMapCreated: (googleMapController) {
        _initializeGoogleMapController(context, googleMapController);
      },
    );
  }
}
