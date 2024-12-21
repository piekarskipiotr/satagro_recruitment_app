part of 'two_dimensional_table_bloc.dart';

class TwoDimensionalTableState extends Equatable {
  const TwoDimensionalTableState({
    required this.columns,
    required this.rows,
    this.error,
  });

  final List<int> columns;
  final List<ChemicalElementRowModel> rows;
  final String? error;

  TwoDimensionalTableState copyWith({
    List<ChemicalElementRowModel>? rows,
    String? error,
  }) {
    return TwoDimensionalTableState(
      rows: rows ?? this.rows,
      columns: columns,
      error: error,
    );
  }

  @override
  List<Object?> get props => [columns, rows, error];
}
