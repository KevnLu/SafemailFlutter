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
        body: Padding( 
          padding: const EdgeInsets.all(20),
         child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(
                text: "INTRADO INTERACTIVE SERVICES CORPORATION\n",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 2.5 
                ),
              ),
              TextSpan(
                text:
                    "SCHOOLMESSENGER SAFEMAIL HUMAN MONITORING SERVICE: SERVICE LEVEL AGREEMENT\n",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16,height: 1.5 ),
              ),
              TextSpan(
                text:
                    "This Service Level Agreement (SLA) for SchoolMessenger's Human Monitoring Service is made by SchoolMessenger in connection with, and is part of, the Customer's SchoolMessenger  Service Contract, the terms of which are hereby incorporated by reference into this SLA and vice versa.\n This SLA establishes the understanding for SchoolMessenger to provide Human Monitoring Services.\n",
                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 14, height: 1.5 ),
              ),
              TextSpan(
                text:
                    '''
Scope of Services
SchoolMessenger shall monitor email communications to and from students within the Customer's SchoolMessenger network during the hours of coverage indicated in section 5 of this SLA. 
For Google Apps for Education Customers, SchoolMessenger shall monitor student Google Drive files and edits within the Customer's system during the hours of coverage indicated in section 5 of this SLA. 
A SchoolMessenger Human Monitor  ('Monitor') shall notify the Customer's  HMS Administrator  and/or Designated Emergency Contacts regarding any reportable content in accordance with this SLA.
Use of student email accounts shall be limited to those individuals granted access/permissions by the Customer.  The Customer shall be solely responsible for the assignment of email accounts, passwords or access codes, and the enforcement of user access security.
SchoolMessenger shall use commercially reasonable efforts to assist the Customer in identifying any known security breach, but SchoolMessenger shall not be liable to the Customer or to any user for any inability, failure or mistake in connection with such assistance.
SchoolMessenger shall not make this Human Monitoring Service available until the Customer has provided SchoolMessenger with the identity of and contact information for their HMS Administrator and Designated Emergency Contacts, pursuant to a completed and submitted HMS Service Configuration Form.
SchoolMessenger provides this Human Monitoring Service to the Customer in order to assist it in the protection of their students.  To that end, SchoolMessenger shall undertake every commercially reasonable effort to update its monitoring services to maximize detection of unsafe, graphic and/or obscene communications to or from the Customer's students.   However, SchoolMessenger does not warrant, represent and/or guarantee that all unsafe communications can or will be detected through the monitoring of these student communications.
Definitions
HMS Administrator/ Primary Contact : the individual designated by the Customer as the primary communication contact between SchoolMessenger and the Customer and who shall manage and operate the SchoolMessenger accounts, security and access on behalf of the Customer's email account users. This individual will also receive SchoolMessenger's HMS email referrals concerning flagged content in accordance with this SLA.
Designated Emergency Contacts : individuals designated by the Customer to be contacted in cases where an imminent threat to student safety has been reported in accordance with this SLA and the primary contact cannot be reached.
SchoolMessenger Human Monitors: SchoolMessenger representatives trained in monitoring email communication and student Google Drive content though the HMS.
Working Hours : 24 (twenty-four) hours a day, 7 (seven) days a week, excluding the following: December 24th at 5pm (Eastern Time Zone) to December 26th at 8am (Eastern Time Zone).
Administrative Access Permissions
SchoolMessenger's Human Monitoring Service is provided to the Customer in accordance with the tiered administrator access permissions selected and configured by the Customer pursuant to their access and security needs.  All such access permissions, and any changes to same, shall be controlled by the Customer.
HMS Administrator/ Primary Contact
Prior to initiating Human Monitoring Services, SchoolMessenger requires that the Customer identify and provide contact information for their designated HMS Administrator, as defined in paragraph 2.
                    ''',
                style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ),
        ),
        );
  }
}
