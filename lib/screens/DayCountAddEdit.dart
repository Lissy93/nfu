import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../form/TargetNameInput.dart';
import '../form/TargetDateInput.dart';
//import '../form/TargetSubmitButton.dart';

import '../models/DayCountModel.dart';
import '../util/Helpers.dart';

// Create a Form widget.
class DayCountFormState extends StatefulWidget {
  bool isEditing;
  @override
  DayCountScreen createState() {
    return DayCountScreen();
  }
}

class DayCountScreen extends State<DayCountFormState> {

//  final DayCount currentData;
//  SecondPage({this.currentData});

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();


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

  handleSubmit () {
    if (_formKey.currentState.validate()) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data'))
      );
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
            if (_formKey.currentState.validate()) {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Processing Data'))
              );
            }
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
                  targetNameInput(),
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
