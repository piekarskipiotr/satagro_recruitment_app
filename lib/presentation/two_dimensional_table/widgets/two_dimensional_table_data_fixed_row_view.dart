import 'package:flutter/material.dart';
import 'package:satagro_recruitment_app/data/enums/enums.dart';

class TwoDimensionalTableDataFixedRowView extends StatelessWidget {
  const TwoDimensionalTableDataFixedRowView({required this.value, required this.sortType, super.key});

  final String value;
  final DataTableSortType sortType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        Icon(sortType.icon, size: 12),
      ],
    );
  }
}
