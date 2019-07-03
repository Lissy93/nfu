import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../models/DayCountModel.dart';
import '../util/Database.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(BuildContext context, {Key key, this.title}) : super(key: key);
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

  // data for testing
  List<DayCount> testDayCounts = [
    DayCount(title: "Raouf", date: 1562147307,),
    DayCount(title: "Zaki", date: 1561974507,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<DayCount>>(
        future: DBProvider.db.getAllDayCounts(),
        builder: (BuildContext context, AsyncSnapshot<List<DayCount>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                DayCount item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    // DBProvider.db.deleteClient(item.id);
                  },
                  child: ListTile(
                    title: Text(item.title),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (bool value) {
                        // DBProvider.db.blockOrUnblock(item);
                        setState(() {});
                      },
                      value: false,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          DayCount rnd = testDayCounts[math.Random().nextInt(testDayCounts.length)];
          await DBProvider.db.insertDayCount(rnd);
          setState(() {});
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}