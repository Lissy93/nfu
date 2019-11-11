import 'package:flutter/material.dart';

/// The InputField for the Create and Edit a Target forms
Widget targetNameInput() {
  return SizedBox(
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
          return 'Target name cannot be empty';
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
  );
}