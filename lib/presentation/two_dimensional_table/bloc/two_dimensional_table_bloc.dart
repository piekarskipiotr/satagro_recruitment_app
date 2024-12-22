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
      : super(TwoDimensionalTableState(columnsData: _generateColumnsData(), rowsData: _generateRowsData())) {
    on<SortData>(_onSortData);
  }

  Future<void> _onSortData(SortData event, Emitter<TwoDimensionalTableState> emit) async {
    final modelId = event.id;
    final model = state.rowsData.singleWhere((e) => e.id == modelId);
    final sortType = DataTableSortType.values.getNext(model.sortType);
    final sortedData = switch (sortType) {
      DataTableSortType.asc => List<double>.from(model.values)..sort((a, b) => a.compareTo(b)),
      DataTableSortType.dsc => List<double>.from(model.values)..sort((a, b) => b.compareTo(a)),
      DataTableSortType.original => List<double>.from(model.originalValues),
    };

    final updatedModel = model.copyWith(values: sortedData, sortType: sortType);
    final modelIndex = state.rowsData.indexOf(model);
    final rowsData = List<ChemicalElementRowModel>.from(state.rowsData)..[modelIndex] = updatedModel;
    emit(state.copyWith(rowsData: rowsData));
  }

  static List<int> _generateColumnsData() {
    return List.generate(8, (index) => index + 1);
  }

  static List<ChemicalElementRowModel> _generateRowsData() {
    final chemicalElementNames = ['Wodór', 'Hel', 'Lit', 'Beryl', 'Bor', 'Węgiel', 'Azot', 'Woda'];
    return chemicalElementNames.map((name) {
      return ChemicalElementRowModel(
        name: name,
        values: List.generate(8, (_) => (Random().nextDouble() * 1000).roundToDouble() / 10),
      );
    }).toList();
  }
}
