import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDataTable extends ConsumerWidget {
  MyDataTable({
    super.key,
    required this.columns,
    required this.dataSource,
    required this.header,
  });
  final int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  final List<DataColumn> columns;
  final MyDataTableSource dataSource;
  final Widget header;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginatedDataTable2(
      header: header,
      rowsPerPage: _rowsPerPage,
      columns: columns,
      empty: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.grey[200],
          child: const Text('No data'),
        ),
      ),
      source: dataSource,
    );
  }
}

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.context, this.cells);
  final BuildContext context;
  final List<List<DataCell>> cells;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    return DataRow2.byIndex(index: index, cells: cells[index]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => cells.length;

  @override
  int get selectedRowCount => 0;
}
