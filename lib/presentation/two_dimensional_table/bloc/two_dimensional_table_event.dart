part of 'two_dimensional_table_bloc.dart';

abstract class TwoDimensionalTableEvent extends Equatable {
  const TwoDimensionalTableEvent();
}

final class SortData extends TwoDimensionalTableEvent {
  const SortData(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
