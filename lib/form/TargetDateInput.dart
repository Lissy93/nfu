import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

///The Date Spinner and Label used in the Create and Edit a Target forms
Widget targetDateInput(BuildContext context, DateTime initialDate, Function updateDate) {
  var selectedDate = initialDate;
  return SizedBox(
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
              updateDate(date);
//              setState(() => selectedDate = date);
            },
            onConfirm: (date) {
              updateDate(date);
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
  );
}
