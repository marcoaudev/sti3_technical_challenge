import 'package:flutter/material.dart';

class TableLegends extends StatelessWidget {
  final List<String> legends;

  const TableLegends({
    super.key,
    required this.legends,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          color: const Color.fromARGB(204, 214, 214, 214), width: 0.85),
      children: [
        TableRow(
          children: legends.map(
           (legend) {
             return TableCellItem(title: legend);
           }, 
          ).toList()
        )
      ],
    );
  }
}

class TableCellItem extends StatelessWidget {
  final String title;
  const TableCellItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: SizedBox(
        height: 40,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
