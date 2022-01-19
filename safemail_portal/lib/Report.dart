import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:safemail_portal/pages/reportcardchart.dart';
import 'package:safemail_portal/pages/reportlinechart.dart';

Future<FilterReport> fetchReport() async {
  final response = await http.get(Uri.parse(
      'https://safemail.schoolmessenger.com/Reports/FilterReport/GetFilterReportDetails?SmarterTrackCustomerId=88&SmarterTrackCustomerId2=221&safeMailCustomerId=5&startDate=2022/01/18&endDate=2022/01/04&includeEmail=true&includeDrive=true&includeCalendar=true&includeYammer=true'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsondata =
        '[{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641340800000)\/","FormattedDate":"01/05"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641427200000)\/","FormattedDate":"01/06"},{"Flags":0,"Filtered":5,"Reviewed":0,"Date":"\/Date(1641513600000)\/","FormattedDate":"01/07"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641600000000)\/","FormattedDate":"01/08"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641686400000)\/","FormattedDate":"01/09"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641772800000)\/","FormattedDate":"01/10"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641859200000)\/","FormattedDate":"01/11"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641945600000)\/","FormattedDate":"01/12"},{"Flags":0,"Filtered":8,"Reviewed":0,"Date":"\/Date(1642032000000)\/","FormattedDate":"01/13"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1642118400000)\/","FormattedDate":"01/14"},{"Flags":0,"Filtered":176,"Reviewed":0,"Date":"\/Date(1642204800000)\/","FormattedDate":"01/15"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1642291200000)\/","FormattedDate":"01/16"},{"Flags":0,"Filtered":30,"Reviewed":0,"Date":"\/Date(1642377600000)\/","FormattedDate":"01/17"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1642464000000)\/","FormattedDate":"01/18"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1642550400000)\/","FormattedDate":"01/19"}]';
    return FilterReport.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load report');
  }
}

class FilterReport {
  final int Flags;
  final int Filtered;
  final String Reviewed;
  final DateTime Date;

  FilterReport(
      {required this.Flags,
      required this.Filtered,
      required this.Reviewed,
      required this.Date});

  factory FilterReport.fromJson(Map<String, dynamic> json) {
    return FilterReport(
      Flags: json['Flags'],
      Filtered: json['Filtered'],
      Reviewed: json['Reviewed'],
      Date: json['Date'],
    );
  }
}

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);
  static const String routeName = '/report';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Report"),
        ),
        body: Container(
          color: const Color(0xff262545),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  left: 2,
                  right: 2,
                ),
                child: ReportCardChart(),
              ),
              Container(height: 5, color: Colors.white),
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
