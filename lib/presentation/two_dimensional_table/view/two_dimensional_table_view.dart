import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satagro_recruitment_app/presentation/two_dimensional_table/bloc/two_dimensional_table_bloc.dart';
import 'package:satagro_recruitment_app/presentation/two_dimensional_table/widgets/widgets.dart';

class TwoDimensionalTableView extends StatelessWidget {
  const TwoDimensionalTableView({super.key});

  void _onSortPressed(BuildContext context, String id) {
    context.read<TwoDimensionalTableBloc>().add(SortData(id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TwoDimensionalTableBloc, TwoDimensionalTableState>(
      builder: (context, state) {
        final error = state.error;
        final isError = error != null && error.isNotEmpty;
        final columnsData = state.columnsData;
        final rowsData = state.rowsData;

        return Scaffold(
          body: SafeArea(
            child: isError
                ? TwoDimensionalTableErrorView(error: error)
                : TwoDimensionalTableDataTableView(
                    columnsData: columnsData,
                    rowsData: rowsData,
                    onRowSortPressed: (id) {
                      _onSortPressed(context, id);
                    },
                  ),
          ),
        );
      },
    );
  }
}
