import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:satagro_recruitment_app/data/enums/enums.dart';
import 'package:satagro_recruitment_app/data/models/models.dart';
import 'package:satagro_recruitment_app/utils/extensions.dart';

part 'two_dimensional_table_event.dart';

part 'two_dimensional_table_state.dart';

class TwoDimensionalTableBloc extends Bloc<TwoDimensionalTableEvent, TwoDimensionalTableState> {
  TwoDimensionalTableBloc()
      : super(
          TwoDimensionalTableState(
            columns: List.generate(8, (index) => index + 1),
            rows: [
              ChemicalElementRowModel(
                name: 'Wodór',
                values: List.generate(8, (_) => (Random().nextDouble() * 1000).roundToDouble() / 10),
              ),
              ChemicalElementRowModel(
                name: 'Hel',
                values: List.generate(8, (_) => (Random().nextDouble() * 1000).roundToDouble() / 10),
              ),
              ChemicalElementRowModel(
                name: 'Lit',
                values: List.generate(8, (_) => (Random().nextDouble() * 1000).roundToDouble() / 10),
              ),
              ChemicalElementRowModel(
                name: 'Beryl',
                values: List.generate(8, (_) => (Random().nextDouble() * 1000).roundToDouble() / 10),
              ),
              ChemicalElementRowModel(
                name: 'Bor',
                values: List.generate(8, (_) => (Random().nextDouble() * 1000).roundToDouble() / 10),
              ),
              ChemicalElementRowModel(
                name: 'Węgiel',
                values: List.generate(8, (_) => (Random().nextDouble() * 1000).roundToDouble() / 10),
              ),
              ChemicalElementRowModel(
                name: 'Azot',
                values: List.generate(8, (_) => (Random().nextDouble() * 1000).roundToDouble() / 10),
              ),
              ChemicalElementRowModel(
                name: 'Woda',
                values: List.generate(8, (_) => (Random().nextDouble() * 1000).roundToDouble() / 10),
              ),
            ],
          ),
        ) {
    on<SortData>(_onSortData);
  }

  Future<void> _onSortData(SortData event, Emitter<TwoDimensionalTableState> emit) async {
    final modelId = event.id;
    final model = state.rows.singleWhere((e) => e.id == modelId);
    final sortType = DataTableSortType.values.getNext(model.sortType);

    final sortedData = switch (sortType) {
      DataTableSortType.asc => List<double>.from(model.values)..sort((a, b) => a.compareTo(b)),
      DataTableSortType.dsc => List<double>.from(model.values)..sort((a, b) => b.compareTo(a)),
      DataTableSortType.original => List<double>.from(model.originalValues),
    };

    final updatedModel = model.copyWith(values: sortedData, sortType: sortType);

    final modelIndex = state.rows.indexOf(model);
    final rows = List<ChemicalElementRowModel>.from(state.rows)..[modelIndex] = updatedModel;

    emit(state.copyWith(rows: rows));
  }
}
