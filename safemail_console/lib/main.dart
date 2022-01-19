// @dart=2.9
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:navigating_drawer/navigating_drawer.dart';
import 'SLA.dart';

void main() {
  runApp(SafemailApp());
}

class SafemailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safemail Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title:'Safemail Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigatingDrawer(
        body: NavigatingDrawerList(
          children: [            
            NavigatingDrawerListItem(
              title: Text('Home'),
              onTap: ()
              {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyHomePage()));
              },
            ),
            NavigatingDrawerListItem(
              title: Text('Report'),
              onTap: ()
              {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyHomePage()));
              },
            ),
            NavigatingDrawerListItem(
              title: Text('SLA'),
              onTap: ()
             {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => sla()));
              },
            ),        
            NavigatingDrawerListItem(
            title: Text('Admin'),
              pushPage: NavigatingDrawerPage(
                body: NavigatingDrawerList(
                  children: [
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
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}