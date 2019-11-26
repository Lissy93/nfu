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
          if (snapshot.hasData && snapshot.data.length > 0) {
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
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You don\'t have any targets yet\n\nTap the Add button to get started\n\n\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.35),
                          fontSize: 36,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1,1),
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
                      ),
                    ),
                  ],
              )
            );
//            return Center(child: CircularProgressIndicator());
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