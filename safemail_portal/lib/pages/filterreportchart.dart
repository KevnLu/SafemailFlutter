import 'dart:async';
import 'dart:convert';
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
  final int Flags;
  final int Filtered;
  final int Reviewed;
  final String Date;

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
  const FilterReportChart({Key? key}) : super(key: key);
  @override
  _FilterReportChartState createState() => _FilterReportChartState();
}

class _FilterReportChartState extends State<FilterReportChart> {
  @override
  Widget build(BuildContext context) {
    final List<FilterReportData> lstData = [
      FilterReportData(Date: "01/04", Reviewed: 10, Flags: 9, Filtered: 15),
      FilterReportData(Date: "01/05", Reviewed: 7, Flags: 5, Filtered: 19),
      FilterReportData(Date: "01/07", Reviewed: 12, Flags: 6, Filtered: 14),
      FilterReportData(Date: "01/08", Reviewed: 8, Flags: 5, Filtered: 17),
    ];

    List<charts.Series<FilterReportData, String>> reportData = [
      charts.Series(
          id: "Reviewed",
          data: lstData,
          domainFn: (FilterReportData data, _) => data.Date,
          measureFn: (FilterReportData data, _) => data.Reviewed),
      charts.Series(
          id: "Filtered",
          data: lstData,
          domainFn: (FilterReportData data, _) => data.Date,
          measureFn: (FilterReportData data, _) => data.Filtered),
      charts.Series(
          id: "Flagged",
          data: lstData,
          domainFn: (FilterReportData data, _) => data.Date,
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
                  ),
                  Expanded(
                    //child: charts.LineChart(reportData, animate: true),
                    child: charts.BarChart(reportData, animate: true),
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


