import 'package:flutter/material.dart';
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

  final GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  navigateToAddNewItem () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          DayCountFormState(scaffoldState: scaffoldState, isEditing: false,)),
    );
  }

  updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
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
                  child: displayDayCount(context, dayCountData, scaffoldState, updateState),
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
          setState(() {});
          navigateToAddNewItem();
        },
        tooltip: 'Add a new target',
        child: Icon(Icons.add),
      ),
    );
  }
}