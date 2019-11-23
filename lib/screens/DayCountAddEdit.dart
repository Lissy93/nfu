import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../util/Database.dart';
import '../form/TargetNameInput.dart';
import '../form/TargetDateInput.dart';
//import '../form/TargetSubmitButton.dart';

import '../models/DayCountModel.dart';
import '../util/Helpers.dart';

// Create a Form widget.
class DayCountFormState extends StatefulWidget {
  final bool isEditing = false;

  DayCount existingDayCount;
  GlobalKey<ScaffoldState> scaffoldState;

//  GlobalKey<ScaffoldState> scaffoldState;

  DayCountFormState({
    Key key,
    this.scaffoldState
//    @required this.existingDayCount,
//    GlobalKey<ScaffoldState> scaffoldState,
  }) : super(key: key);

  @override
  DayCountScreen createState() => new DayCountScreen(existingDayCount, scaffoldState);

}

class DayCountScreen extends State<DayCountFormState> {

//  final DayCount currentData;
//  SecondPage({this.currentData});

  DayCount existingDayCount;
  GlobalKey<ScaffoldState> scaffoldState;

  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  final targetNameController = TextEditingController();

  DayCountScreen(this.existingDayCount, this.scaffoldState);

  @override
  void dispose() {
    targetNameController.dispose();
    super.dispose();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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

      // Hit the insert method of the database controller
      await DBProvider.db.insertDayCount(dayCountData);

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
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Add new Target'),
      ),
      body:
        Padding (
          padding: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          child:
            Form(
              key: _formKey,
              child: Column(
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
    );
  }
}
