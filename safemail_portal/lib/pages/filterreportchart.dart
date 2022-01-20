import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

Future<FilterReportData> fetchReport() async {
  final response = await http.get(Uri.parse(
      'https://safemail.schoolmessenger.com/Reports/FilterReport/GetFilterReportDetails?SmarterTrackCustomerId=88&SmarterTrackCustomerId2=221&safeMailCustomerId=5&startDate=2022/01/18&endDate=2022/01/04&includeEmail=true&includeDrive=true&includeCalendar=true&includeYammer=true'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return FilterReportData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load report');
  }
}

Future<List<FilterReportData>> fetchReport1() async {
  var url =
      'https://safemail.schoolmessenger.com/Reports/FilterReport/GetFilterReportDetails?SmarterTrackCustomerId=88&SmarterTrackCustomerId2=221&safeMailCustomerId=5&startDate=2022/01/18&endDate=2022/01/04&includeEmail=true&includeDrive=true&includeCalendar=true&includeYammer=true';
  final client = http.Client();

  final response = await client.get(Uri.parse(url));
/*
  var request = new HttpRequest()
    ..open('GET', url, async: false)
    ..send();
*/
  var list = json
      .decode(response.body)['results']
      .map((data) => FilterReportData.fromJson(data))
      .toList();

  return list;
}

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
    List<FilterReportData> lstData = [
      FilterReportData(Date: "01/04", Reviewed: 0, Flags: 0, Filtered: 0),
      FilterReportData(Date: "01/05", Reviewed: 0, Flags: 0, Filtered: 0),
      FilterReportData(Date: "01/06", Reviewed: 0, Flags: 0, Filtered: 0),
      FilterReportData(Date: "01/07", Reviewed: 0, Flags: 0, Filtered: 0),
    ];
    final List<FilterReportData> lstEmailData = [
      FilterReportData(Date: "01/04", Reviewed: 10, Flags: 9, Filtered: 15),
      FilterReportData(Date: "01/05", Reviewed: 7, Flags: 5, Filtered: 19),
      FilterReportData(Date: "01/06", Reviewed: 12, Flags: 6, Filtered: 14),
      FilterReportData(Date: "01/07", Reviewed: 8, Flags: 5, Filtered: 17),
    ];
    final List<FilterReportData> lstDriveData = [
      FilterReportData(Date: "01/04", Reviewed: 20, Flags: 19, Filtered: 25),
      FilterReportData(Date: "01/05", Reviewed: 17, Flags: 15, Filtered: 23),
      FilterReportData(Date: "01/06", Reviewed: 17, Flags: 7, Filtered: 19),
      FilterReportData(Date: "01/07", Reviewed: 8, Flags: 5, Filtered: 17),
    ];
    final List<FilterReportData> lstCalendarData = [
      FilterReportData(Date: "01/04", Reviewed: 2, Flags: 0, Filtered: 7),
      FilterReportData(Date: "01/05", Reviewed: 4, Flags: 1, Filtered: 9),
      FilterReportData(Date: "01/06", Reviewed: 3, Flags: 1, Filtered: 8),
      FilterReportData(Date: "01/07", Reviewed: 6, Flags: 0, Filtered: 7),
    ];

    if (widget.selectedSources.contains("Email")) {
      for (var sourceItem in lstEmailData) {
        var item = lstData.firstWhere((item) => item.Date == sourceItem.Date);
        item.Filtered += sourceItem.Filtered;
        item.Flags += sourceItem.Flags;
        item.Reviewed += sourceItem.Reviewed;
      }
    }

    if (widget.selectedSources.contains("Drive")) {
      for (var sourceItem in lstDriveData) {
        var item = lstData.firstWhere((item) => item.Date == sourceItem.Date);
        item.Filtered += sourceItem.Filtered;
        item.Flags += sourceItem.Flags;
        item.Reviewed += sourceItem.Reviewed;
      }
    }

    if (widget.selectedSources.contains("Calendar")) {
      for (var sourceItem in lstCalendarData) {
        var item = lstData.firstWhere((item) => item.Date == sourceItem.Date);
        item.Filtered += sourceItem.Filtered;
        item.Flags += sourceItem.Flags;
        item.Reviewed += sourceItem.Reviewed;
      }
    }

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
      padding: EdgeInsets.all(20),
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
                    fontSize: 30),
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
              SizedBox(
                height: 40,
              ),
              Text(
                "Source: School Messenger",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
