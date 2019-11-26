import 'package:flutter/material.dart';

import '../util/Database.dart';
import '../form/TargetNameInput.dart';
import '../form/TargetDateInput.dart';
import '../models/DayCountModel.dart';

// Create a Form widget.
class DayCountFormState extends StatefulWidget {

  bool isEditing = false;
  DayCount existingDayCount;
  GlobalKey<ScaffoldState> scaffoldState;

  DayCountFormState({
    Key key,
    this.isEditing,
    this.existingDayCount,
    this.scaffoldState,
  }) : super(key: key);

  @override
  DayCountScreen createState() => new DayCountScreen(isEditing, existingDayCount, scaffoldState);

}

class DayCountScreen extends State<DayCountFormState> {

  bool isEditing;
  DayCount existingDayCount;
  GlobalKey<ScaffoldState> scaffoldState;

  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final targetNameController = TextEditingController();

  DayCountScreen(this.isEditing, this.existingDayCount, this.scaffoldState, );

  @override
  void dispose() {
    targetNameController.dispose();
    super.dispose();
  }

  updateDateState (DateTime newDate) {
    setState(() => selectedDate = newDate);
  }

  handleSubmit () async {
    if (_formKey.currentState.validate()) {
      // Get the data: Target name and date
      var targetName = targetNameController.text;
      var targetDate = selectedDate.millisecondsSinceEpoch;
      var dayCountData = DayCount(title: targetName, date: targetDate);

      // Checks if updating an existing record, or creating a new one, then hit the DB
      if (isEditing) {
        await DBProvider.db.updateDayCount(dayCountData);
      } else {
        await DBProvider.db.insertDayCount(dayCountData);
      }


      // Indicate success by popping open a snackbar
      final snackBar = new SnackBar(content: new Text('\'$targetName\' has been added'));
      this.scaffoldState.currentState.showSnackBar(snackBar);


      // Reset the state, and navigate back to the last screen
      setState(() {});
      Navigator.pop(context);
    }
  }

  /// The Submit button for the Create and Edit a Target forms
  Widget targetSubmitButton() {
    return SizedBox(
        width: double.infinity,
        height: 60,
        child:
        RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25)
          ),
          color: Colors.cyan,
          elevation: 4.0,
          splashColor: Colors.cyanAccent,
          onPressed: () {
            handleSubmit();
          },
          child: Text(
            'Save',
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 24
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {

    // If editing, then populate title and date with existing values
    if (isEditing) {
      targetNameController.text = existingDayCount.title;
      selectedDate = new DateTime.fromMillisecondsSinceEpoch(existingDayCount.date);
    }
    final double paddingValue = isEditing? 2 : 24;
    final double maxHeight = isEditing? 300 : 600;

    return new Container(
        constraints: BoxConstraints(
          maxHeight: maxHeight,
          minWidth: 300,
        ),
        child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: isEditing? null : AppBar(title: Text('Add new Target')),
        body:
        Padding (
          padding: EdgeInsets.symmetric(vertical: paddingValue*2, horizontal: paddingValue),
          child:
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding (padding: EdgeInsets.all(6)),
                targetNameInput(targetNameController),
                Padding (padding: EdgeInsets.all(12)),
                targetDateInput(context, selectedDate, updateDateState),
                Padding (padding: EdgeInsets.all(12)),
                targetSubmitButton(),
              ],
            ),
          ),
        ),
      )
    );


  }
}
