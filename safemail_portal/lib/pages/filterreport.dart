import 'package:flutter/material.dart';
import 'package:safemail_portal/pages/reportcardchart.dart';
import '../utils/multiSelect.dart';
import 'filterreportchart.dart';

class FilterReport extends StatefulWidget {
  const FilterReport({Key? key}) : super(key: key);

  @override
  _FilterReportState createState() => _FilterReportState();
}

class _FilterReportState extends State<FilterReport> {
  List<String> _selectedItems = ['Email', 'Drive', 'Calendar'];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = ['Email', 'Drive', 'Calendar'];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Report'),
      ),
      body: Container(
        //padding: const EdgeInsets.all(20),
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // use this button to open the multi-select dialog
            ElevatedButton(
              child: const Text('Select Report Sources'),
              onPressed: _showMultiSelect,
            ),
            const Divider(
              height: 30,
            ),
            // display selected items
            Wrap(
              children: _selectedItems
                  .map((e) => Chip(
                        label: Text(e),
                      ))
                  .toList(),
            ),
            SizedBox(height: 10),
            FilterReportChart(selectedSources: _selectedItems)
          ],
        ),
      ),
    );
  }
}
