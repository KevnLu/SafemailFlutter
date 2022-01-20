import 'package:flutter/material.dart';
import 'filterreport_data_mock.dart';

class FilterReportTable extends StatefulWidget {
  List<String> selectedSources;
  FilterReportTable({Key? key, required this.selectedSources})
      : super(key: key);
  @override
  _FilterReportTableState createState() => _FilterReportTableState();
}

class _FilterReportTableState extends State<FilterReportTable> {
  @override
  Widget build(BuildContext context) {
    var dataMock = DataMock();
    var lstData = dataMock.GenerateData(widget.selectedSources);
    return DataTable(
      columns: [
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Filtered')),
        DataColumn(label: Text('Reviewed')),
        DataColumn(label: Text('Flags')),
      ],
      rows:
          lstData // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((element) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(element.Date)), //Extracting from Map element the value
                        DataCell(Text(element.Filtered.toString())),
                        DataCell(Text(element.Reviewed.toString())),
                        DataCell(Text(element.Flags.toString())),
                      ],
                    )),
              )
              .toList(),
    );
  }
}