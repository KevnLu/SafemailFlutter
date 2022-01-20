import 'package:flutter/material.dart';

class sla extends StatelessWidget {
  static const String routeName = '/sla';

  const sla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SLA"),
          backgroundColor: Color.fromRGBO(88, 45, 130, 1),
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
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text:
                    "SCHOOLMESSENGER SAFEMAIL HUMAN MONITORING SERVICE: SERVICE LEVEL AGREEMENT\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextSpan(
                text:
                    "This Service Level Agreement (SLA) for SchoolMessenger's Human Monitoring Service is made by SchoolMessenger in connection with, and is part of, the Customer's SchoolMessenger  Service Contract, the terms of which are hereby incorporated by reference into this SLA and vice versa.\n This SLA establishes the understanding for SchoolMessenger to provide Human Monitoring Services.\n",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
            ],
          ),
        ));
  }
}
