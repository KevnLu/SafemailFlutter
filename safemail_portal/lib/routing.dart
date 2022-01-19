import 'package:flutter/material.dart';
import 'package:navigating_drawer/navigating_drawer.dart';
import 'package:safemail_portal/sla.dart';
import 'pages/FilterReport.dart';
import 'package:safemail_portal/reporttable.dart';
import 'pages/filterreportchart.dart';

class Routing extends StatelessWidget {
  const Routing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NavigatingDrawer(
        body: NavigatingDrawerList(
      children: [
        NavigatingDrawerListItem(
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        NavigatingDrawerListItem(
          title: const Text('Filter Report'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
              //builder: (BuildContext context) => const FilterReportChart()));
              builder: (BuildContext context) => const FilterReport()));
          },
        ),
        NavigatingDrawerListItem(
          title: const Text('SLA'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const sla()));
          },
        ),
        NavigatingDrawerListItem(
              title: Text('ReportTable'),
              onTap: ()
             {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => reporttable()));
              },
            ),
        NavigatingDrawerListItem(
          title: const Text('Admin'),
          pushPage: NavigatingDrawerPage(
            body: NavigatingDrawerList(
              children: const [
                NavigatingDrawerListItem(
                  title: Text('Maintain Users'),
                ),
                NavigatingDrawerListItem(
                  title: Text('Customer Report'),
                ),
                NavigatingDrawerListItem(
                  title: Text('Hourly Report'),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
