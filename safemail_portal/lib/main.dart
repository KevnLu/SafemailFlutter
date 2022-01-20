// @dart=2.9
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:safemail_portal/pages/reportcardchart.dart';
import 'package:safemail_portal/pages/reportlinechart.dart';
import 'package:safemail_portal/utils/colorsutil.dart';
import 'routing.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('background message: ${message.notification.body}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();

    FirebaseMessaging.instance.getToken().then((value) {
      print('get device_token: ${value}');
    });

    FirebaseMessaging.onBackgroundMessage(_messageHandler);
  }
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
  //FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      FirebaseMessaging.onMessage.listen((RemoteMessage event) {
        print("message recieved");
        print(event.notification.title);
        print(event.notification.body);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(event.notification.title),
                content: Text(event.notification.body),
                actions: [
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      });
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        print('Message clicked!');
      });
    }
  }

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
