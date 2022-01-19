import 'dart:async';
import 'dart:convert';
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
      {
        required this.Flags,
        required this.Filtered,
        required this.Reviewed,
        required this.Date
      }
  );

  factory FilterReport.fromJson(Map<String, dynamic> json) {
    return FilterReport(
      Flags: json['Flags'],
      Filtered: json['Filtered'],
      Reviewed: json['Reviewed'],
      Date: json['Date'],
    );
  }
}
