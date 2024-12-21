import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satagro_recruitment_app/presentation/two_dimensional_table/bloc/two_dimensional_table_bloc.dart';
import 'package:satagro_recruitment_app/presentation/two_dimensional_table/view/two_dimensional_table_view.dart';

class TwoDimensionalTablePage extends StatelessWidget {
  const TwoDimensionalTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TwoDimensionalTableBloc(),
      child: const TwoDimensionalTableView(),
    );
  }
}
