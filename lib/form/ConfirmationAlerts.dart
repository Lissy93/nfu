import 'package:flutter/material.dart';
import '../models/DayCountModel.dart';
import '../util/Helpers.dart';

Future<void> showResetDialog(DayCount dayCount, BuildContext currentContext, Function actionFunc) async {
  final todaysDate = makeReadableDateFromDate(new DateTime.now().millisecondsSinceEpoch);
  return showDialog<void>(
    context: currentContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset this target?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Doing this will the date of this target to $todaysDate, and the day count back to 0\n'),
              Text('Alternativley, you can set to a different date or modify details, by tapping the Edit button'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('No, Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Yes, Reset Target'),
            onPressed: () {
              actionFunc(dayCount);
            },
          ),
        ],
      );
    },
  );
}

Future<void> showDeleteDialog(DayCount dayCount, BuildContext currentContext, Function actionFunc) async {
  final targetName = dayCount.title;
  return showDialog<void>(
    context: currentContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete this target?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want permantly to delete target: $targetName?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('No, Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Yes, Delete Target'),
            onPressed: () {
              actionFunc(dayCount);
            },
          ),
        ],
      );
    },
  );
}
