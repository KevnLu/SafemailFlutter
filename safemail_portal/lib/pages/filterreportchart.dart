//import 'dart:html';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

import 'filterreport_data_mock.dart';

class FilterReportData {
  int Flags;
  int Filtered;
  int Reviewed;
  String Date;

  FilterReportData(
      {required this.Flags,
      required this.Filtered,
      required this.Reviewed,
      required this.Date});

  factory FilterReportData.fromJson(Map<String, dynamic> json) {
    return FilterReportData(
      Flags: json['Flags'],
      Filtered: json['Filtered'],
      Reviewed: json['Reviewed'],
      Date: json['Date'],
    );
  }
}

class FilterReportChart extends StatefulWidget {
  List<String> selectedSources;
  FilterReportChart({Key? key, required this.selectedSources})
      : super(key: key);
  @override
  _FilterReportChartState createState() => _FilterReportChartState();
}

class _FilterReportChartState extends State<FilterReportChart> {
  @override
  Widget build(BuildContext context) {
    var dataMock = DataMock();
    var lstData = dataMock.GenerateData(widget.selectedSources);
    
    List<charts.Series<FilterReportData, String>> reportData = [
      charts.Series(
          id: "Reviewed",
          data: lstData,
          domainFn: (FilterReportData data, _) => data.Date,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          measureFn: (FilterReportData data, _) => data.Reviewed),
      charts.Series(
          id: "Filtered",
          data: lstData,
          domainFn: (FilterReportData data, _) => data.Date,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          measureFn: (FilterReportData data, _) => data.Filtered),
      charts.Series(
          id: "Flagged",
          data: lstData,
          domainFn: (FilterReportData data, _) => data.Date,
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          measureFn: (FilterReportData data, _) => data.Flags),
    ];

    return Container(
      height: 400,
      padding: const EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Filter Report",
                style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Expanded(
                //child: charts.LineChart(reportData, animate: true),
                child: charts.BarChart(reportData, animate: true),
              ),
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.crop_square,
                    color: Colors.red,
                    size: 24.0,
                  ),
                  Text("Reviewed"),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.crop_square,
                    color: Colors.green,
                    size: 24.0,
                  ),
                  Text("Filtered"),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.crop_square,
                    color: Colors.blue,
                    size: 24.0,
                  ),
                  Text("Flagged"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
