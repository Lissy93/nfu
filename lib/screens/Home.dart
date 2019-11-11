import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../screens/DayCountAddEdit.dart';
import '../models/DayCountModel.dart';
import '../util/Database.dart';
import '../widgets/DisplayDayCount.dart';

class NfuHome extends StatefulWidget {
  NfuHome(BuildContext context, {Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NfuHomeState createState() => _NfuHomeState();
}

class _NfuHomeState extends State<NfuHome> {
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

  navigateToAddNewItem () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DayCountFormState()),
    );
  }

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
                DayCount dayCountData = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    // DBProvider.db.deleteClient(item.id);
                  },
                  child: displayDayCount(context, dayCountData),
                );
              },
            );
          } else {
            print('No data returned');
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
//          DBProvider.db.deleteAll();
//          DayCount rnd = testDayCounts[math.Random().nextInt(testDayCounts.length)];
//          await DBProvider.db.insertDayCount(rnd);
//          setState(() {});
          navigateToAddNewItem();

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}