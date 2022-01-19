import 'package:flutter/material.dart';
import 'package:safemail_portal/pages/reportcardchart.dart';
import 'package:safemail_portal/pages/reportlinechart.dart';

class LineReport extends StatelessWidget {
  const LineReport({Key? key}) : super(key: key);
  static const String routeName = '/linereport';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("FILTERING REPORT"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  left: 2,
                  right: 2,
                ),
                child: ReportCardChart(),
              ),
              Container(height: 1, color: Colors.black),
              const Padding(
                padding: EdgeInsets.only(
                  left: 2,
                  right: 2,
                ),
                child: ReportLineChart(),
              ),
            ],
          ),
        ));
  }
}
