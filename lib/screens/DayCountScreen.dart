import 'package:flutter/material.dart';
import '../models/DayCountModel.dart';
import '../util/Helpers.dart';

class DayCountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Column(
        children: <Widget> [
          TextFormField(
          decoration: InputDecoration(
              labelText: 'Enter your username'
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        ]


      ),
    );
  }
}