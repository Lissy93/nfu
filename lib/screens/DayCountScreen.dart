import 'package:flutter/material.dart';
import '../models/DayCountModel.dart';
import '../util/Helpers.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  DayCountScreen createState() {
    return DayCountScreen();
  }
}

class DayCountScreen extends State<MyCustomForm> {
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
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Pick a name for your target",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                        ),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if(val.length==0) {
                        return "Name cannot be empty";
                      }else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 24,
                    ),
                  ),
                  RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context)
                              .showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text('Submit'),
                    ),
                ],
              ),
            ),
        ),
    );
  }
}
