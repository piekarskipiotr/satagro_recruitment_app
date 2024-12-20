import 'package:flutter/material.dart';
import 'package:satagro_recruitment_app/presentation/home/widgets/home_navigation_button.dart';
import 'package:satagro_recruitment_app/presentation/polygons_map/view/polygons_map_page.dart';
import 'package:satagro_recruitment_app/presentation/two_dimensional_table/view/two_dimensional_table_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeNavigationButton(
              label: 'Polygons map',
              page: PolygonsMapPage(),
            ),
            SizedBox(height: 16),
            HomeNavigationButton(
              label: 'Two-dimensional table',
              page: TwoDimensionalTablePage(),
            ),
          ],
        ),
      ),
    );
  }
}
