// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../utils/IconContainer.dart';

class ReportCardChart extends StatefulWidget {
  const ReportCardChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReportCardChartState();
}

class ReportCardChartState extends State<ReportCardChart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: <
        Widget>[
      Expanded(
        child: IconContainer("Emails", "124", Icons.circle, Colors.black, 30),
      ),
      Expanded(
        child: IconContainer("Drive", "12", Icons.circle, Colors.black, 30),
      ),
      Expanded(
        child: IconContainer("Calendar", "140", Icons.circle, Colors.black, 30),
      ),
      Expanded(
        child: IconContainer("Referrals", "0", Icons.circle, Colors.black, 30),
      ),
    ]);
  }
}
