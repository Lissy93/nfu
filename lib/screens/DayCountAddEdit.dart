import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../models/DayCountModel.dart';
import '../util/Helpers.dart';

// Create a Form widget.
class DayCountFormState extends StatefulWidget {
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
                SizedBox(
                width: double.infinity,
                  height: 60,
                  child:
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Pick a name for your target",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.length==0) {
                          return 'Name cannot be empty';
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 24,
                      ),
                    ),
                ),
                  Padding (padding: EdgeInsets.all(12)),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child:
                    OutlineButton(
                      color: Colors.white,
                      shape:
                        new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25)
                        ),
                      borderSide: BorderSide(color: Theme.of(context).accentColor ),
                      splashColor: Colors.cyanAccent[100],
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: new DateTime.now(),
                            onChanged: (date) {
                              setState(() => selectedDate = date);
                            },
                            onConfirm: (date) {
                              setState(() => selectedDate = date);
                            },
                            currentTime: selectedDate, locale: LocaleType.en);
                      },
                      child: Text(
                        'Date: $selectedDate',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 24
                        ),
                      ),
                    ),
                  ),
                  Padding (padding: EdgeInsets.all(12)),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child:
                      RaisedButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25)
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        splashColor: Colors.cyanAccent,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Scaffold.of(context)
                                .showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child: Text(
                            'Save',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 24
                            ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}
