import 'package:flutter/material.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  List<List<String>> data = [
    ['row 1 column 1', 'row 1 column 2', 'row 1 column 3'],
    ['row 2 column 1', 'row 2 column 2', 'row 2 column 3'],
  ];

  void addRow() {
    setState(() {
      final columnCount = data.first.length;
      final rowCount = data.length;
      List<String> rowData = [];

      for (int i = 0; i < columnCount; ++i) {
        rowData.add('row ${rowCount + 1} column ${i + 1}');
      }

      data.add(rowData);
    });
  }

  void addColumn() {
    setState(() {
      final columnCount = data.first.length;
      //final rowCount = data.length;

      int count = 1;
      for (List<String> row in data) {
        row.add('row $count column ${columnCount + 1}');
        ++count;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Table(
          border: TableBorder.all(),
          children: data
              .map((row) => TableRow(
                    children: row
                        .map((cell) =>
                            TableCell(child: Center(child: Text(cell))))
                        .toList(),
                  ))
              .toList(),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              addRow();
            });
          },
          child: const Text('表格添加行'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              addColumn();
            });
          },
          child: const Text('表格添加列'),
        ),
      ],
    );
  }
}
