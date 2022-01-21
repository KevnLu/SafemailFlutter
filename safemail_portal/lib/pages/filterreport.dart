import 'package:flutter/material.dart';
import 'package:safemail_portal/pages/filterreporttable.dart';
//import 'package:safemail_portal/pages/reportcardchart.dart';
import '../utils/multiSelect.dart';
import 'filterreportchart.dart';

class FilterReport extends StatefulWidget {
  const FilterReport({Key? key}) : super(key: key);

  @override
  _FilterReportState createState() => _FilterReportState();
}

class _FilterReportState extends State<FilterReport> {
  //List<String> _selectedItems = ['Email', 'Drive', 'Calendar'];
  List<SelectItem> _selectedItems = [
    SelectItem(Name: "Email", Checked: true),
    SelectItem(Name: "Drive", Checked: true),
    SelectItem(Name: "Calendar", Checked: true),
  ];
  //List<string, bool> _checkBoxItems

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = ['Email', 'Drive', 'Calendar'];
    //final List<String> _items = _selectedItems;

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _selectedItems);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        for (var item in _selectedItems) {
          item.Checked = results.contains(item.Name);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> _sources = [];
    for (var item in _selectedItems) {
      if (item.Checked) _sources.add(item.Name);
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Filter Report'),
        backgroundColor: Color.fromRGBO(88, 45, 130, 1),
      ),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.all(20),
        //height: 600,
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
              children: _sources
                  .map((e) => Chip(
                        label: Text(e),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            FilterReportChart(selectedSources: _sources),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: FilterReportTable(selectedSources: _sources),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Source: School Messenger",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
