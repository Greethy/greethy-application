import 'package:flutter/material.dart';

class DynamicTable extends StatelessWidget {
  final int rows;
  final int columns;
  final List<List<Widget>> cells;

  DynamicTable({
    required this.rows,
    required this.columns,
    required this.cells,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      children: List.generate(rows, (rowIndex) {
        return TableRow(
          children: List.generate(columns, (colIndex) {
            if (rowIndex == 0) {
              // Header row
              return Container(
                height: 50,
                color: Colors.grey[300],
                child: Center(
                  child: cells[0][colIndex],
                ),
              );
            } else {
              // Content rows
              return Container(
                height: 50,
                child: Center(
                  child: cells[rowIndex][colIndex],
                ),
              );
            }
          }),
        );
      }),
    );
  }
}