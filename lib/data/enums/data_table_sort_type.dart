import 'package:flutter/material.dart';

enum DataTableSortType {
  asc,
  dsc,
  original;

  IconData get icon => switch (this) {
        DataTableSortType.asc => Icons.arrow_upward_rounded,
        DataTableSortType.dsc => Icons.arrow_downward_rounded,
        DataTableSortType.original => Icons.sort_rounded,
      };
}
