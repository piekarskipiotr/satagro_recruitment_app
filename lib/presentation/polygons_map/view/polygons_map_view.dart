import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:satagro_recruitment_app/presentation/polygons_map/bloc/polygons_map_bloc.dart';
import 'package:satagro_recruitment_app/presentation/polygons_map/widgets/polygons_map_error_view.dart';

class PolygonsMapView extends StatelessWidget {
  const PolygonsMapView({super.key});

  void _initializeGoogleMapController(BuildContext context, GoogleMapController googleMapController) {
    context.read<PolygonsMapBloc>().add(InitializeGoogleMapController(googleMapController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PolygonsMapBloc, PolygonsMapState>(
        builder: (context, state) {
          final error = state.error;
          if (error != null && error.isNotEmpty) return PolygonsMapErrorView(error: error);

          return GoogleMap(
            padding: const EdgeInsets.only(right: 16, bottom: 24),
            myLocationEnabled: true,
            initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
            onMapCreated: (googleMapController) {
              _initializeGoogleMapController(context, googleMapController);
            },
          );
        },
      ),
    );
  }
}
