import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:html';

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

List<FilterReportData> fetchReport1() {
  var url =
      'https://safemail.schoolmessenger.com/Reports/FilterReport/GetFilterReportDetails?SmarterTrackCustomerId=88&SmarterTrackCustomerId2=221&safeMailCustomerId=5&startDate=2022/01/18&endDate=2022/01/04&includeEmail=true&includeDrive=true&includeCalendar=true&includeYammer=true';

  var request = new HttpRequest()
    ..open('GET', url, async: false)
    ..send();

  var list = json
      .decode(request.responseText ?? "")['results']
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


class FilterReport extends StatefulWidget {
  const FilterReport({Key? key}) : super(key: key);
  @override
    _FilterReportState createState() => _FilterReportState();
}

class _FilterReportState extends State<FilterReport> {
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
        id: "Subscribers",
        data: lstData,
        domainFn: (FilterReportData data, _) => data.Date,
        measureFn: (FilterReportData data, _) => data.Reviewed,
      )
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Filter Report")),
      body: Center(
        child: Container(
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
        )
      ),
    );
  }
}

// class FilterReport extends StatefulWidget {
//   const FilterReport({Key? key}) : super(key: key);

//   @override
//   FilterReportState createState() => FilterReportState();
// }

//class FilterReport extends StatelessWidget {

// class FilterReport extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool? animate;

//   const FilterReport(this.seriesList, {this.animate});

//   /// Creates a [LineChart] with sample data and no transition.
//   factory FilterReport.withSampleData() {
//     return FilterReport(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return charts.LineChart(seriesList,
//         defaultRenderer:
//             new charts.LineRendererConfig(includeArea: true, stacked: true),
//         animate: animate);
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<FilterReportData, DateTime>> _createSampleData() {

//     //var myReportdata = fetchReport().then((value) => null);
//     //List<FilterReportData> lstReportData = await myReportdata;
//     var myReportdata = fetchReport1();

//     return [
//       charts.Series<FilterReportData, DateTime>(
//         id: 'Mobile',
//         // colorFn specifies that the line will be green.
//         colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//         // areaColorFn specifies that the area skirt will be light green.
//         areaColorFn: (_, __) =>
//             charts.MaterialPalette.green.shadeDefault.lighter,
//         domainFn: (FilterReportData reportData, _) => reportData.Date,
//         measureFn: (FilterReportData reportData, _) => reportData.Flags,
//         data: myReportdata,
//       ),
//     ];
//   }
// }
