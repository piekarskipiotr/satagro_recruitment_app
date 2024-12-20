import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satagro_recruitment_app/presentation/polygons_map/bloc/polygons_map_bloc.dart';
import 'package:satagro_recruitment_app/presentation/polygons_map/view/polygons_map_view.dart';

class PolygonsMapPage extends StatelessWidget {
  const PolygonsMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PolygonsMapBloc(),
      child: const PolygonsMapView(),
    );
  }
}
