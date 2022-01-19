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
                Text("B.Tech", textScaleFactor: 1),
                Text("ABESEC", textScaleFactor: 1),
                Text("AKTU", textScaleFactor: 1),
                Text("AKTU", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("12th", textScaleFactor: 1),
                Text("Delhi Public School", textScaleFactor: 1),
                Text("CBSE", textScaleFactor: 1),
                Text("AKTU", textScaleFactor: 1),
              ]),
              TableRow(children: [
                Text("High School", textScaleFactor: 1),
                Text("SFS", textScaleFactor: 1),
                Text("ICSE", textScaleFactor: 1),
                Text("AKTU", textScaleFactor: 1),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}

class ReportItem{
  final String date='';
}
