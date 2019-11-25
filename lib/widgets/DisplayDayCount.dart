import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import '../models/DayCountModel.dart';
import '../util/Database.dart';
import '../util/Helpers.dart';
import '../screens/DayCountAddEdit.dart';
import '../form/ConfirmationAlerts.dart';


DayCount dayCount;

BuildContext currentContext;

Function parentUpdate;

Widget displayDayCount(BuildContext context, DayCount dayCountData, GlobalKey<ScaffoldState> scaffoldState, Function updateState) {
  dayCount = dayCountData;
  currentContext = context;
  parentUpdate = updateState;
  var _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
//  var _foldingCellKey = new Key(dayCountData.id.toString());
  return GestureDetector(
      onTap: () {
        _foldingCellKey?.currentState?.toggleFold();
      },
    child: Container(
      padding: new EdgeInsets.all(5),
      child:
          SimpleFoldingCell(
          key: _foldingCellKey,
          frontWidget: _buildFrontWidget(context),
          innerTopWidget: _buildInnerTopWidget(context),
          innerBottomWidget: _buildOptionsButtonRowWidget(dayCount),
          cellSize: Size(MediaQuery.of(context).size.width, 125),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 5,
          onOpen: () => print('cell opened'+dayCount.id.toString()),
          onClose: () => print('cell closed')
        ),
    )
  );
}

Widget _buildFrontWidget(context) {
  return Container(
      color: Color(0xff6200ED),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      _buildDateDisplayWidget(context, false),
        ],
      ));
}

getDayCountText(int date) {
  return makeDayCountFromDate(new DateTime.fromMillisecondsSinceEpoch(date)).toString()+" Days";
}

Widget _buildInnerTopWidget(context) {
  return Container(
      color: Color(0xff8A28FF),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildDateDisplayWidget(context, true),
        ],
      ));
}

Widget _buildDateDisplayWidget(context, bool open) {
  return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child:
        Column(
          children: <Widget>[
            Text(
              dayCount.title+(open ? ' Since': ' For '),
            style: TextStyle(
                color: Colors.deepPurple[100],
                fontFamily: 'OpenSans',
                fontSize: 24,
            ),
          ),
            Text(
              open? makeReadableDateFromDate(dayCount.date) : getDayCountText(dayCount.date),
              style: TextStyle(
                color: Colors.deepPurple[100],
                fontFamily: 'OpenSans',
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
          ),Text(
              open? 'Tap to hide Options': 'Tap for more Options',
              style: TextStyle(
                color: Colors.deepPurple[300],
                fontFamily: 'OpenSans',
                fontSize: 14,
              ),
          ),
    ],
  ),
  );
}

Widget _buildOptionsButtonWidget(String text, IconData icon, Function action) {
  return FlatButton(
    onPressed: action,
    color: Color(0xff8A28FF),
    padding: EdgeInsets.all(10.0),
    child: Row( // Replace with a Row for horizontal icon + text
      children: <Widget>[
        Icon(
          icon,
          color: Colors.deepPurple[100],
        ),
        Text(
          text,
          style: TextStyle(color: Colors.deepPurple[100]),

        )
      ],
    ),
  );
}

Widget _buildOptionsButtonRowWidget(DayCount dayCount) {
  return Container(
    color: Colors.blueGrey[100],
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildOptionsButtonWidget('Edit', Icons.edit, openEdit),
        _buildOptionsButtonWidget('Reset', Icons.update, () => showResetDialog(dayCount, currentContext, resetDays)),
        _buildOptionsButtonWidget('Delete', Icons.delete, () => showDeleteDialog(dayCount, currentContext, deleteItem)),
      ],
    )
  );
}

class DayCountFormWidget extends State<DayCountFormState> {
  @override
  Widget build(BuildContext context) {}
}

void _showEditDialog() {
  showDialog(
      context: currentContext,
      builder: (currentContext) {
        return AlertDialog(
          title: Text('Edit Target'),
          content: DayCountFormState(isEditing: true),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                },
                child: Text('Close')),
            FlatButton(
              onPressed: () {
                print('HelloWorld!');
              },
              child: Text('Print HelloWorld!'),
            )
          ],
        );
      });
}


/// Calls to DB to delete a given daycount, and calls to update UI
deleteItem(DayCount dayCountToDelete){
  DBProvider.db.deleteDayCount(dayCountToDelete.id);
  updateUiAfterChange('Target: \''+ dayCountToDelete.title+'\' has been deleted');
}

openEdit() {
  _showEditDialog();
}

/// Sets the current date of a selected record to Today, then updates the UI
resetDays(DayCount dayCountToUpdate) {
  // Make the Update
  dayCountToUpdate.date = new DateTime.now().millisecondsSinceEpoch;
  DBProvider.db.updateDayCount(dayCountToUpdate);

  updateUiAfterChange('Target: \''+ dayCountToUpdate.title+'\' has been reset to today');
}

/// Closes dialog, show success snackbar and updates the parent state
updateUiAfterChange(String successMsg) {
  // Close the dialog
  Navigator.of(currentContext).pop();

  // Show a success message
  final snackBar = SnackBar(
      content: Text(successMsg)
  );
  Scaffold.of(currentContext).showSnackBar(snackBar);

  // Update the parent state
  parentUpdate();
}
