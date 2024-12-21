import 'package:satagro_recruitment_app/data/enums/enums.dart';
import 'package:uuid/uuid.dart';

class ChemicalElementRowModel {
  ChemicalElementRowModel({
    required this.name,
    required this.values,
    String? id,
    List<double>? originalValues,
    this.sortType = DataTableSortType.original,
  })  : id = id ?? const Uuid().v4(),
        originalValues = List.unmodifiable(originalValues ?? values);

  final String id;
  final String name;
  final List<double> originalValues;
  List<double> values;
  DataTableSortType sortType;

  ChemicalElementRowModel copyWith({
    List<double>? values,
    DataTableSortType? sortType,
  }) {
    return ChemicalElementRowModel(
      values: values ?? this.values,
      sortType: sortType ?? this.sortType,
      name: name,
      id: id,
      originalValues: originalValues,
    );
  }
}
