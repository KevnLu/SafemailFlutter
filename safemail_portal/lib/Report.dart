import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<FilterReport> fetchReport() async {
  final response = await http.get(Uri.parse(
      'https://safemail.schoolmessenger.com/Reports/FilterReport/GetFilterReportDetails?SmarterTrackCustomerId=88&SmarterTrackCustomerId2=221&safeMailCustomerId=5&startDate=2022/01/18&endDate=2022/01/04&includeEmail=true&includeDrive=true&includeCalendar=true&includeYammer=true'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
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
  static const String routeName = '/report';

  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Report"),
        ),
        body: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text: "INTRADO INTERACTIVE SERVICES CORPORATION\n",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text:
                    "SCHOOLMESSENGER SAFEMAIL HUMAN MONITORING SERVICE: SERVICE LEVEL AGREEMENT\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              TextSpan(
                text:
                    "This Service Level Agreement (SLA) for SchoolMessenger's Human Monitoring Service is made by SchoolMessenger in connection with, and is part of, the Customer's SchoolMessenger  Service Contract, the terms of which are hereby incorporated by reference into this SLA and vice versa.\n This SLA establishes the understanding for SchoolMessenger to provide Human Monitoring Services.\n",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
              ),
            ],
          ),
        ));
  }
}
