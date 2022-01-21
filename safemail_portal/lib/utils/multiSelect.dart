import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  final List<SelectItem> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  //final List<String> _selectedItems;

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      widget.items.firstWhere((element) => element.Name == itemValue).Checked =
          isSelected;
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    List<String> lstItemNames = [];
    for (var item in widget.items) {
      if (item.Checked) lstItemNames.add(item.Name);
    }
    Navigator.pop(context, lstItemNames);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: item.Checked,
                    title: Text(item.Name),
                    selected: item.Checked,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) =>
                        _itemChange(item.Name, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}

class SelectItem {
  String Name;
  bool Checked;

  SelectItem({required this.Name, required this.Checked});
}
