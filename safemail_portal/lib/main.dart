// @dart=2.9
import 'package:flutter/material.dart';
import 'package:safemail_portal/pages/reportcardchart.dart';
import 'package:safemail_portal/pages/reportlinechart.dart';
import 'package:safemail_portal/utils/colorsutil.dart';
import 'routing.dart';

void main() {
  runApp(const SafemailApp());
}

class SafemailApp extends StatelessWidget {
  const SafemailApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safemail Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Safemail Portal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Routing(),
      appBar: AppBar(
          backgroundColor: ColorsUtil.hexColor('#582D82'),
          title: Container(
            padding:
                const EdgeInsets.only(left: 0, right: 10, top: 5, bottom: 0),
            alignment: Alignment.topRight,
            height: 60,
            child: Image.asset('assets/logo.png'),
          )
          //   Text(widget.title),
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
      ),
    );
  }
}
