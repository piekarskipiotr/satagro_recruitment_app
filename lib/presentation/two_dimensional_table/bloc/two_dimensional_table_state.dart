part of 'two_dimensional_table_bloc.dart';

class TwoDimensionalTableState extends Equatable {
  const TwoDimensionalTableState({
    required this.columnsData,
    required this.rowsData,
    this.error,
  });

  final List<int> columnsData;
  final List<ChemicalElementRowModel> rowsData;
  final String? error;

  TwoDimensionalTableState copyWith({
    List<ChemicalElementRowModel>? rowsData,
    String? error,
  }) {
    return TwoDimensionalTableState(
      rowsData: rowsData ?? this.rowsData,
      columnsData: columnsData,
      error: error,
    );
  }

  @override
  List<Object?> get props => [rowsData, columnsData, error];
}
