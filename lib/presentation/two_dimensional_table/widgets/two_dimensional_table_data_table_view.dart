import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:satagro_recruitment_app/data/models/models.dart';
import 'package:satagro_recruitment_app/presentation/two_dimensional_table/widgets/two_dimensional_table_data_default_view.dart';
import 'package:satagro_recruitment_app/presentation/two_dimensional_table/widgets/two_dimensional_table_data_fixed_row_view.dart';

class TwoDimensionalTableDataTableView extends StatelessWidget {
  const TwoDimensionalTableDataTableView({
    required this.columnsData,
    required this.rowsData,
    required this.onRowSortPressed,
    super.key,
  });

  final List<int> columnsData;
  final List<ChemicalElementRowModel> rowsData;
  final void Function(String id) onRowSortPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 320, // Fixed height for showcase of two-dimensional scroll
        child: DataTable2(
          scrollController: ScrollController(),
          isVerticalScrollBarVisible: true,
          isHorizontalScrollBarVisible: true,
          fixedLeftColumns: 1,
          minWidth: 900,
          fixedCornerColor: Colors.transparent,
          fixedColumnsColor: Colors.grey.shade300,
          headingRowColor: WidgetStateProperty.all(Colors.grey.shade300),
          columns: [
            const DataColumn2(label: SizedBox.shrink()),
            ...columnsData.map((e) => DataColumn2(label: TwoDimensionalTableDataDefaultView(value: e))),
          ],
          rows: rowsData.map((e) {
            final cells = [
              DataCell(
                TwoDimensionalTableDataFixedRowView(value: e.name, sortType: e.sortType),
                onTap: () {
                  onRowSortPressed.call(e.id);
                },
              ),
              ...e.values.map((e) => DataCell(TwoDimensionalTableDataDefaultView(value: e))),
            ];
            return DataRow2(cells: cells);
          }).toList(),
        ),
      ),
    );
  }
}
