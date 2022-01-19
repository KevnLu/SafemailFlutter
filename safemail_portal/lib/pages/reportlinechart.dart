// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//[{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641340800000)\/","FormattedDate":"01/05"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641427200000)\/","FormattedDate":"01/06"},{"Flags":0,"Filtered":5,"Reviewed":0,"Date":"\/Date(1641513600000)\/","FormattedDate":"01/07"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641600000000)\/","FormattedDate":"01/08"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641686400000)\/","FormattedDate":"01/09"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641772800000)\/","FormattedDate":"01/10"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641859200000)\/","FormattedDate":"01/11"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1641945600000)\/","FormattedDate":"01/12"},{"Flags":0,"Filtered":8,"Reviewed":0,"Date":"\/Date(1642032000000)\/","FormattedDate":"01/13"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1642118400000)\/","FormattedDate":"01/14"},{"Flags":0,"Filtered":176,"Reviewed":0,"Date":"\/Date(1642204800000)\/","FormattedDate":"01/15"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1642291200000)\/","FormattedDate":"01/16"},{"Flags":0,"Filtered":30,"Reviewed":0,"Date":"\/Date(1642377600000)\/","FormattedDate":"01/17"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1642464000000)\/","FormattedDate":"01/18"},{"Flags":0,"Filtered":0,"Reviewed":0,"Date":"\/Date(1642550400000)\/","FormattedDate":"01/19"}]

class Linesales {
  DateTime time;
  int sale;
  Linesales(this.time, this.sale);
}

class _LineChart extends StatelessWidget {
  const _LineChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return getLine();
  }

  Widget getLine() {
    List<Linesales> dataLine = [
      new Linesales(new DateTime(2022, 1, 1), 10),
      new Linesales(new DateTime(2022, 1, 2), 100),
      new Linesales(new DateTime(2022, 1, 3), 200),
      new Linesales(new DateTime(2022, 1, 4), 323),
      new Linesales(new DateTime(2022, 1, 5), 331),
      new Linesales(new DateTime(2022, 1, 6), 332),
      new Linesales(new DateTime(2022, 1, 7), 332),
      new Linesales(new DateTime(2022, 1, 8), 332),
      new Linesales(new DateTime(2022, 1, 9), 333),
      new Linesales(new DateTime(2022, 1, 10), 133),
      new Linesales(new DateTime(2022, 1, 11), 233),
      new Linesales(new DateTime(2022, 1, 12), 213),
    ];

    var seriesLine = [
      charts.Series<Linesales, DateTime>(
        data: dataLine,
        domainFn: (Linesales lines, _) => lines.time,
        measureFn: (Linesales lines, _) => lines.sale,
        id: "Lines",
      )
    ];
    //TimeSeriesChart
    Widget line = charts.TimeSeriesChart(seriesLine);
    //line = charts.LineChart(series);
    return line;
  }
}

class ReportLineChart extends StatefulWidget {
  const ReportLineChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReportLineChartState();
}

class ReportLineChartState extends State<ReportLineChart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          width: double.infinity,
          height: 60.0,
          child: Align(
            child: Text(
              'FILTERING REPORT',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 400.0,
          child: const _LineChart(),
        ),
      ],
    );
  }
}
