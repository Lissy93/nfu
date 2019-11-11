import 'package:flutter/material.dart';

// TODO This is not working: Hmmmmmmm, unsure why...
/// The Submit button for the Create and Edit a Target forms
Widget targetSubmitButton(Function handleSubmit) {
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
      onPressed: handleSubmit(),
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