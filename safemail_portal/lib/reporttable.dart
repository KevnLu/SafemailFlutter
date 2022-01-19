import 'package:flutter/material.dart';

class reporttable extends StatefulWidget {
  static const String routeName = '/reporttable';

  @override
  _reporttableState createState() => _reporttableState();
}

class _reporttableState extends State<reporttable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReportTable"),
        backgroundColor: Color.fromRGBO(88, 45, 130, 1),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Table",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(children: [
                Text(
                  "DATE",
                  textScaleFactor: 1,
                ),
                Text("NO. ITEMS FILTERED", textScaleFactor: 1),
                Text("NO. REVIEWED BY HMS", textScaleFactor: 1),
                Text("REFERRALS SENT", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/04", textScaleFactor: 1),
                Text("204", textScaleFactor: 1),
                Text("280", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/05", textScaleFactor: 1),
                Text("199", textScaleFactor: 1),
                Text("103", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/06", textScaleFactor: 1),
                Text("242", textScaleFactor: 1),
                Text("197", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/07", textScaleFactor: 1),
                Text("254", textScaleFactor: 1),
                Text("141", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/08", textScaleFactor: 1),
                Text("238", textScaleFactor: 1),
                Text("43", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/09", textScaleFactor: 1),
                Text("57", textScaleFactor: 1),
                Text("13", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/10", textScaleFactor: 1),
                Text("263", textScaleFactor: 1),
                Text("100", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/11", textScaleFactor: 1),
                Text("288", textScaleFactor: 1),
                Text("61", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/12", textScaleFactor: 1),
                Text("240", textScaleFactor: 1),
                Text("75", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/13", textScaleFactor: 1),
                Text("350", textScaleFactor: 1),
                Text("109", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/14", textScaleFactor: 1),
                Text("346", textScaleFactor: 1),
                Text("175", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/15", textScaleFactor: 1),
                Text("238", textScaleFactor: 1),
                Text("122", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/16", textScaleFactor: 1),
                Text("53", textScaleFactor: 1),
                Text("4", textScaleFactor: 1),
                Text("0", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/17", textScaleFactor: 1),
                Text("66", textScaleFactor: 1),
                Text("94", textScaleFactor: 1),
                Text("1", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("01/18", textScaleFactor: 1),
                Text("148", textScaleFactor: 1),
                Text("51", textScaleFactor: 1),
                Text("1", textScaleFactor: 1),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}

class ReportItem{
  late String date;
  late int Filtered;
  late int Reviewed;
  late int Referals;
}
